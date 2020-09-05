__precompile__()
module StaticArrayUtils

import StaticArrays;
global const SA = StaticArrays;

export SVec, SVec2, SVec3, SVec4
export SVec3x, SVec3y, SVec3z
export SVec4x, SVec4y, SVec4z, SVec4w
export SMat, SMat33, SMat44

export MVec, MVec3, MVec4
export MMat, MMat33

isdefined(StaticArrayUtils, :SVec) || global const SVec{S,T} = SA.SVector{S,T};
isdefined(StaticArrayUtils, :MVec) || global const MVec{S,T} = SA.MVector{S,T};
isdefined(StaticArrayUtils, :SMat) || global const SMat{S1,S2,T,L} = SA.SMatrix{S1,S2,T,L};
isdefined(StaticArrayUtils, :MMat) || global const MMat{S1,S2,T,L} = SA.MMatrix{S1,S2,T,L};


SVec2(x::T) where {T} = SVec{2,T}( x, x )

SVec2(x::T, y::T) where {T} = SVec{2,T}( x, y )

SVec2( xy::Tuple{T,T} ) where {T} = SVec{2,T}( xy[1], xy[2] )

SVec2(v::AbstractVector{T}) where {T} = SVec{2,T}( v[1], v[2] )


SVec3(x::T) where {T} = SVec{3,T}( x, x, x )

SVec3(x::T, y::T, z::T) where {T} = SVec{3,T}( x, y, z )

SVec3( xy::Tuple{T,T}, z::T ) where {T} = SVec{3,T}( xy[1], xy[2], z )

SVec3(v::AbstractVector{T}) where {T} = SVec{3,T}(v[1], v[2], v[3])


SVec3x(x::T) where {T} = SVec3( x, zero(T), zero(T) )

SVec3y(y::T) where {T} = SVec3( zero(T), y, zero(T) )

SVec3z(z::T) where {T} = SVec3( zero(T), zero(T), z )



SVec4(x::T) where {T} = SVec{4,T}( x, x, x, x )

SVec4(x::T, y::T, z::T, w::T) where {T} = SVec{4,T}(x,y,z,w)

SVec4x(x::T) where {T} = SVec{4,T}( x, zero(T), zero(T), zero(T) )
SVec4y(y::T) where {T} = SVec{4,T}( zero(T), y, zero(T), zero(T) )
SVec4z(z::T) where {T} = SVec{4,T}( zero(T), zero(T), z, zero(T) )
SVec4w(w::T) where {T} = SVec{4,T}( zero(T), zero(T), zero(T), w )

SVec4(v::AbstractVector{T}, w::T) where {T} = SVec{4,T}(v[1], v[2], v[3], w)


SMat33(T=Float64) = SMat{3,3,T,9}(
    one(T), zero(T), zero(T),
    zero(T), one(T), zero(T),
    zero(T), zero(T), one(T)
)

@inline function SMat33(
    R11::T, R21::T, R31::T,
    R12::T, R22::T, R32::T,
    R13::T, R23::T, R33::T
) where {T}

    matrix = SMat{3,3,T,9}(
        R11, R21, R31,
        R12, R22, R32,
        R13, R23, R33
    )
    return matrix
end

@inline function SMat33(v1, v2, v3)
    SMat33(
        v1[1], v1[2], v1[3],
        v2[1], v2[2], v2[3],
        v3[1], v3[2], v3[3]
    )
end


SMat44(T=Float64) = SMat{4,4,T,16}(
    one(T), zero(T), zero(T), zero(T),
    zero(T), one(T), zero(T), zero(T),
    zero(T), zero(T), one(T), zero(T),
    zero(T), zero(T), zero(T), one(T)
)

@inline function SMat44(
    R11::T, R21::T, R31::T, R41::T,
    R12::T, R22::T, R32::T, R42::T,
    R13::T, R23::T, R33::T, R43::T,
    R14::T, R24::T, R34::T, R44::T
) where {T}

    matrix = SMat{4,4,T,16}(
        R11, R21, R31, R41,
        R12, R22, R32, R42,
        R13, R23, R33, R43,
        R14, R24, R34, R44
    )
    return matrix
end

@inline function SMat44(v1, v2, v3, v4)
    SMat44(
        v1[1], v1[2], v1[3], v1[4],
        v2[1], v2[2], v2[3], v2[4],
        v3[1], v3[2], v3[3], v3[4],
        v4[1], v4[2], v4[3], v4[4]
    )
end


MVec3(x::T) where {T} = MVec{3,T}( x, x, x )

MVec3(x::T, y::T, z::T) where {T} = MVec{3,T}(x,y,z)



MVec4(x::T) where {T} = MVec{4,T}( x, x, x, x )

MVec4(w::T, x::T, y::T, z::T) where {T} = MVec{4,T}(w,x,y,z)


MMat33(T=Float64) = MMat{3,3,T,9}( one(T), zero(T), zero(T), zero(T), one(T), zero(T), zero(T), zero(T), one(T) )

end # module
