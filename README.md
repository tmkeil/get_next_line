# get_next_line

## Project Goal

Implement a function that reads from a file descriptor and returns **one line at a time**, no matter how long the line is or how the input is split internally.

The challenge lies in handling **buffers, memory, and edge cases**.

---

## 🧠 What I Learned

* **How file descriptors and `read()` really work**
* **Managing buffers across multiple function calls**
* **Static variables and persistent state**
* **String handling and dynamic memory allocation**

---

## Project Requirements

Each call to the function char `*get_next_line(int fd)` should return the next line from the file – including the newline character (`\n`), if there is one.

It must:

- Handle reading from a file **chunk by chunk** (`BUFFER_SIZE`)
- Keep track of what's already been read, without losing or duplicating anything
- Return `NULL` when the end of the file is reached

---

## How It Works

1. Read from the file descriptor in small blocks (`BUFFER_SIZE`)
2. Store the leftover part of the read (the “rest”) in a **static variable**
3. As soon as you find a `\n`, return everything up to and including it
4. On the next call, continue with the leftover “rest”

---

## Bonus Part

In the bonus version, `get_next_line` must work with **multiple file descriptors at the same time**

---

## Why This Was Harder Than Expected

At first glance, it’s just: "read and return the next line."  
But making that work with:

- unknown line lengths,  
- limited buffer sizes,  
- partial reads,  
- and memory management

makes this project a real deep dive into low-level programming.

---

## Reusability

This function is very useful in future 42 projects where you're not allowed to use `fgets`, `getline`, or other standard functions.
