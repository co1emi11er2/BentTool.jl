# ----------------
# SIDEWALK
# ----------------

@with_kw_noshow struct Sidewalk
    width::float_ft = 0.0ft
    thickness::float_ft = 0.0ft
    density::float_kcf = 0.15kcf
    dist_bk_start::Int64
    dist_bk_end::Int64
    dist_fd_start::Int64
    dist_fd_end::Int64

    function Sidewalk(
        width, 
        thickness, 
        density, 
        dist_bk_start, 
        dist_bk_end, 
        dist_fd_start, 
        dist_fd_end
        )
        new(
            width       |> to_ft, 
            thickness   |> to_ft, 
            density     |> to_kcf, 
            dist_bk_start   |> to_int, 
            dist_bk_end     |> to_int, 
            dist_fd_start   |> to_int, 
            dist_fd_end     |> to_int
        )

    end
end

Base.show(io::IO, x::Sidewalk) = custom_show(x)