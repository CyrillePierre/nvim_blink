#include <iostream>
#include <vector>
#include <mutex>
#include <condition_variable>
#include <stdexcept>

template<typename T>
class CircularBuffer {
public:
    CircularBuffer(size_t size) : buffer(size), head(0), tail(0), full(false) {}

    void push(const T& item) {
        std::unique_lock<std::mutex> lock(mutex);
        cond_full.wait(lock, [this] { return !full; });
        buffer[tail] = item;
        tail = (tail + 1) % buffer.size();
        full = tail == head;
        cond_empty.notify_one();
    }

    T pop() {
        std::unique_lock<std::mutex> lock(mutex);
        cond_empty.wait(lock, [this] { return head != tail || full; });
        T item = buffer[head];
        head = (head + 1) % buffer.size();
        full = false;
        cond_full.notify_one();
        return item;
    }

    bool isEmpty() const {
        std::lock_guard<std::mutex> lock(mutex);
        return (!full && (head == tail));
    }

private:
    std::vector<T> buffer;
    size_t head, tail;
    bool full;
    mutable std::mutex mutex;
    std::condition_variable cond_full, cond_empty;
};

void testCircularBuffer() {
    CircularBuffer<int> cb(5);

    // Push elements
    cb.push(1);
    cb.push(2);
    cb.push(3);

    // Pop elements
    std::cout << "Popped: " << cb.pop() << std::endl; // Should print 1
    std::cout << "Popped: " << cb.pop() << std::endl; // Should print 2

    // Push more elements
    cb.push(4);
    cb.push(5);
    cb.push(6);

    // Pop remaining elements
    while (!cb.isEmpty()) {
        std::cout << "Popped: " << cb.pop() << std::endl;
    }
}

int main() {
    testCircularBuffer();
    return 0;
}
