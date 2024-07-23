# ----------------
# RAIL INFO
# ----------------
"""
    struct RailInfo

Includes rail info for the span.

# Fields

    `rail_left::Rail` - left rail of span
    `rail_right::Rail` - right rail of span
    `rail_3rd::Rail = RailType.None` - 3rd rail of span (if any)

# Constructors
"""
@with_kw_noshow struct RailInfo
    dist_outside_to_all::Bool
    rail_left::Rail
    rail_right::Rail
    rail_3rd::Rail = RailType.None
end

Base.show(io::IO, x::RailInfo) = custom_show(io, x)
