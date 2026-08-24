# PATH-TRACER-ENGINE

## About

A concurrent BVH-accelerated C++20 path tracer, supporting both CPU and GPU compute.
CMake build system, GNU + NVCC compilers

## Current status of the project

Not abandoned - just put off in order to build infra to support this project. See:

- [`bvh-builder`](https://github.com/ms1d/bvh-builder): the **most** important library,
needed to build acceleration structures for CPU and CUDA targets.

- [`thread-poollib`](https://github.com/ms1d/thread-poollib): re-used in `bvh-builder`,
will also hopefully be re-used in the CPU path tracer

- [`memory-poollib`](https://github.com/ms1d/memory-poollib): same as above

I have plans to write a specialised HTTP server as well, although this
will most likely take place after a basic renderer backend has been built.
Similar to the architecture of `bvh-builder`, I will most likely make
this renderer a daemon that clients can call upon. The code, as of writing,
is quite old and was not well thought out at all - please do not judge too harshly!

## Plan

### Phase 0

- Rip out the old interfaces and libraries (not needed any more)

- Fix build system

### Phase 1

- Start with the CPU

- Take in BVH input, concurrently render over a thread pool

- Stream pixels to UDP clients + send checkpoints over TCP

### Phase 2

- Add CUDA support to replace the CPU thread pool

- If time allows, benchmark against OptiX and Vulkan backends

- Experiment with denoising and upscaling, especially on XDNA 1 NPUs

## Architecture (will be modified)

- Master process - manages 2 child processes (`http-server`, `path-tracer`)

- HTTP - accepts standard REST API requests (health check, submit render)

- Path Tracer - concurrently renders pixels; streams results back to UDP clients

- Also contains a CPU only executeable for generating BVHs

## Current Build Instructions

- Configuration: `cmake --preset <preset name>`. See CMakePresets.json for presets

- Build: `cmake --build --preset <preset name>`

- Test: `cd build/<preset name> && ctest` from project root

## Contributions

Advice + guidance appreciated, but this is mainly a solo learning project for myself.
Feel free to contact me for any queries or concerns.
