### A Pluto.jl notebook ###
# v0.14.2

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ ce13397e-9f16-11eb-2aeb-8d4ec79e6314
using PlutoUI, Plots

# ╔═╡ e25e45c8-3bf0-4ee3-a805-2eb758bf8769
L = 1; ϕ²(x,n) = 2/L*sin(n*π/L*x)^2;

# ╔═╡ 77de5996-81dc-4ad8-864a-21fea1851014
md"
**Primero estado**

Coeficiente de mezcla: $(@bind α₁ Slider(0.0:0.1:1.0, show_value=true))

Nivel de energía: $\;$ $(@bind n₁ Select([string(n) for n ∈ 1:10]))

**Segundo estado:** 

Coeficiente de mezcla: $(@bind α₂ Slider(0.0:0.1:1.0, show_value=true)) 

Nivel de energía: $\;$ $(@bind n₂ Select([string(n) for n ∈ 1:10]))

**Tercer estado:** 

Coeficiente de mezcla: $(@bind α₃ Slider(0.0:0.1:1.0, show_value=true)) 

Nivel de energía: $\;$ $(@bind n₃ Select([string(n) for n ∈ 1:10]))
"

# ╔═╡ 744eb7f4-43c6-47e5-9e7b-38e9077b4331
begin
	d₁, d₂, d₃ = x -> ϕ²(x, parse(Int8, n₁)), x -> ϕ²(x, parse(Int8, n₂)), x -> ϕ²(x,parse(Int8, n₃))   
	α = [α₁, α₂, α₃]
	d = [d₁, d₂, d₃]
	mezcla = x -> 3/sum(α)*sum([(y -> prop*densidad(y))(x) 
			                       for (prop, densidad) ∈ zip(α, d)])
end;

# ╔═╡ ddf51566-ae1f-42ec-8a10-d83b892f3b87
xgrid = 0.0:0.01:L;

# ╔═╡ e49c4f05-27e6-424d-be60-8a47320ce555
plot(xgrid, mezcla.(xgrid))

# ╔═╡ Cell order:
# ╠═e25e45c8-3bf0-4ee3-a805-2eb758bf8769
# ╟─e49c4f05-27e6-424d-be60-8a47320ce555
# ╟─77de5996-81dc-4ad8-864a-21fea1851014
# ╟─744eb7f4-43c6-47e5-9e7b-38e9077b4331
# ╟─ce13397e-9f16-11eb-2aeb-8d4ec79e6314
# ╟─ddf51566-ae1f-42ec-8a10-d83b892f3b87
