# CppCon 2022 - Back to Basics C++ API Design - Jason Turner

!!! cite
    - [GutHub CppCon](https://github.com/CppCon/CppCon2022/tree/main)
    - [Youtube](https://youtu.be/zL-vn_pGGgY?si=S7mGTiImdlfpYl6J)

## Summary

!!! abstract "Illustrates which are the bad and the good habits while writing a C++ API"

## Conclusion

!!! success "Its all about making your API hard to use wrong"
    Its all about making your API hard to use wrong by:
    - Trying to use your API incorrectly
    - Using better naming
    - Use `[[nodiscard]]` liberally
    - Never return a ray pointer, instead prefer references or better: smart pointers
    - Use `noexcept` to indicate that a function does not raise errors
    - Provide consistent and IMPOSSIBLE to ignore error handling (avoid returning error codes for instance and prefer throwing errors)
    - Use strong types (that can not be constructed with cast / different inputs) and avoid implicit conversions. For instance, std::filesystem is a weak type since it can be constructed with a string, a const char*, etc... Prevent conversions by using `delete` on the relevant constructors and functions (sparingly).
    - Avoid passing raw pointers except for optional and unique arguments
    - Limit API visibility to the required on no more
    - Use `constexpr` unless there is a good reason
