# ----------------
# RAILINFO
# ----------------

"""
    struct RailInfo

Contains information for the rails of a bridge.

# Fields
- `rail_left::Rail` - left rail on the bridge
- `rail_right::Rail` - right rail on the bridge
- `rail_3rd::Rail = Rail(RailType.None)` - 3rd rail on the bridge (if any)
- `dist_outside_to_all::Bool = False` - whether to distribute outside rail to all beams
- `dist_bk_start::Int64 = 0` - back span start beam to distribute 3rd rail
- `dist_bk_end::Int64 = 0` - back span end beam to distribute 3rd rail
- `dist_fd_start::Int64 = 0` - fwd span start beam to distribute 3rd rail
- `dist_fd_end::Int64 = 0` - fwd span start beam to distribute 3rd rail

# Constuctors
```
RailInfo(
    rail_left,
    rail_right,
    rail_3rd = Rail(RailType.None),
    dist_outside_to_all::Bool = False,
    dist_bk_start = 0,
    dist_bk_end = 0,
    dist_fd_start = 0,
    dist_fd_end = 0,
) -> RailInfo
```

# Examples

```julia-repl
julia> RailInfo(
	Rail("SSTR"),
	Rail(RailType.T222),
)
RailInfo
  rail_left: SSTR
  rail_right: T222
  rail_3rd: None
```
"""
@with_kw_noshow struct RailInfo
    rail_left::Rail
    rail_right::Rail
    rail_3rd::Rail = Rail(RailType.None)
    dist_outside_to_all::Bool = false
    dist_bk_start::Int64 = 0
    dist_bk_end::Int64 = 0
    dist_fd_start::Int64 = 0
    dist_fd_end::Int64 = 0

    function RailInfo(
        rail_left,
        rail_right,
        rail_3rd = Rail(RailType.None),
        dist_outside_to_all = false,
        dist_bk_start = 0,
        dist_bk_end = 0,
        dist_fd_start = 0,
        dist_fd_end = 0,
    )

        new(
            rail_left,
            rail_right,
            rail_3rd,
            dist_outside_to_all |> to_bool,
            dist_bk_start |> to_int,
            dist_bk_end |> to_int,
            dist_fd_start |> to_int,
            dist_fd_end |> to_int, 
        )
    end

end

function Base.show(io::IO, x::RailInfo) 
    rail_info = typeof(x)
    rail_left = string(x.rail_left.type)
    rail_right = string(x.rail_right.type)
    rail_3rd = string(x.rail_3rd.type)
    s = """
    $(rail_info)
      rail_left: $(rail_left)
      rail_right: $(rail_right)
      rail_3rd: $(rail_3rd)
    """
    print(io, s)
end
