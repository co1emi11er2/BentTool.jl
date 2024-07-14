@with_kw_noshow struct RailInfo
    dist_outside_to_all::Bool
    rail_left::Rail
    rail_right::Rail
    rail_3rd::Rail
    dist_bk_start::Int64
    dist_bk_end::Int64
    dist_fd_start::Int64
    dist_fd_end::Int64
end

Base.show(io::IO, ::MIME"text/plain", x::RailInfo) = custom_show(x)