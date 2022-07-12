# Common.jl
using Dates
import Base.<, Base.==, Base.show, Base.string

abstract type Asset end

abstract type Property <: Asset end
abstract type Investment <: Asset end
abstract type Cash <: Asset end

abstract type House <: Property end

abstract type Bond <: Investment end
abstract type Equity <: Investment end

# simple functions on abstract types
describe(a::Asset) = "Something valuable"
describe(e::Investment) = "Financial investment"
describe(e::Property) = "Physical property"
describe(e::House) = "Owned Home"
describe(e::Bond) = "Fixed income investment loaned to an entity"
describe(e::Equity) = "Shares in a company"

struct Stock 
  symbol::String
  name::String
end

Base.string(s::Stock)=s.symbol*":"*s.name
Base.show(io::IO, s::Stock)=show(io, string(s))

struct Value
  stock::Stock
  value::Float64 
  dateValued::Date
end

mutable struct Holding
  date::Date
  stock::Stock
  count::Float16
end

Base.string(h::Holding)=string(h.date)*":"*string(h.stock)*":"*string(h.count)
Base.show(io::IO, h::Holding)=show(io,string(h))

<(h1::Holding, h2::Holding)=isless(h1,h2)
Base.isless(h1::Holding, h2::Holding)=h1.date < h2.date
==(h1::Holding, h2::Holding)=h1.stock.symbol==h2.stock.symbol
Base.isequal(h1::Holding, h2::Holding)=isequal(h1.stock.symbol, h2.stock.symbol)