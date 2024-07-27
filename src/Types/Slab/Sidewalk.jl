# ----------------
# SIDEWALK
# ----------------
"""
    struct Sidewalk

Contains information for the sidewalk of a bridge.

# Fields
- `width::float_ft = 0.0ft` - width of the sidewalk
- `thickness::float_inch = 0.0inch` - thickness of the sidewalk
- `density::float_kcf = 0.15kcf` -  density of the sidewalk
- `dist_bk_start::Int64 = 0` - back span start beam to distribute sidewalk
- `dist_bk_end::Int64 = 0` - back span end beam to distribute sidewalk
- `dist_fd_start::Int64 = 0` - fwd span start beam to distribute sidewalk
- `dist_fd_end::Int64 = 0` - fwd span start beam to distribute sidewalk

# Constuctors
```
Sidewalk(
    width = 0.0ft, 
    thickness = 0.0inch, 
    density = 0.15kcf, 
    dist_bk_start = 0, 
    dist_bk_end = 0, 
    dist_fd_start = 0, 
    dist_fd_end = 0
    ) -> Sidewalk
```

# Examples

```julia-repl
julia> Sidewalk()
Sidewalk
  width: 0.0 ft
  thickness: 0.0 inch
  density: 0.15 kcf
  dist_bk_start: 0
  dist_bk_end: 0
  dist_fd_start: 0
  dist_fd_end: 0

julia> Sidewalk(10, 4)
Sidewalk
  width: 10.0 ft
  thickness: 4.0 inch
  density: 0.15 kcf
  dist_bk_start: 0
  dist_bk_end: 0
  dist_fd_start: 0
  dist_fd_end: 0
```
"""
@with_kw_noshow struct Sidewalk
    width::float_ft = 0.0ft
    thickness::float_inch = 0.0inch
    density::float_kcf = 0.15kcf
    dist_bk_start::Int64 = 0
    dist_bk_end::Int64 = 0
    dist_fd_start::Int64 = 0
    dist_fd_end::Int64 = 0

    function Sidewalk(
        width = 0.0ft, 
        thickness = 0.0inch, 
        density = 0.15kcf, 
        dist_bk_start = 0, 
        dist_bk_end = 0, 
        dist_fd_start = 0, 
        dist_fd_end = 0
        )
        new(
            width       |> to_ft, 
            thickness   |> to_inch, 
            density     |> to_kcf, 
            dist_bk_start   |> to_int, 
            dist_bk_end     |> to_int, 
            dist_fd_start   |> to_int, 
            dist_fd_end     |> to_int
        )

    end
end

Base.show(io::IO, x::Sidewalk) = custom_show(io, x)