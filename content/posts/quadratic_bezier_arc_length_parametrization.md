+++
title = "Bézier curve arc length parametrizations"
description = ""
tags = [
    "Bézier",
    "Schanuel's conjecture",
    "Closed form",
]
date = "2024-07-17"
categories = [
    "proofs"
]
images = ""
fediverse = 112804172497431735
+++

Bézier curves are widely used for defining vector graphics. They are basically polynomial parametric curves, but given in the Bernstein basis, which enables us to define the curve using control points. The first and last control point define the start and endpoint of the curves, the intermediate control points kind of bend the curve. The two types of Bézier curves which are generally used are quadratic and cubic Bézier curves. Quadratic Bézier curves are given by three control points, cubic Bézier curves by four. If you want to know more, [Wikipedia](https://en.wikipedia.org/wiki/B%C3%A9zier_curve) is a good starting point.

# Arc lengths

{{< figure src="/arc_lengths.svg" class="mid" caption="Two cubic Bézier curves with different arc lengths" >}}

The arc length of a curve is the distance traveled when moving along the curve from start to end.
It is well known in the computer graphics community that the arc length of cubic Bézier curves has no closed form and has to be computed numerically. Sadly, I've not yet seen a proof sketch for that, though. Most people just link to the [Abel-Ruffini theorem](https://en.wikipedia.org/wiki/Abel%E2%80%93Ruffini_theorem), but that is not directly applicable as far as I know. I'll leave the challenge of proving that to a later post and deal with the quadratic Bézier curves for now. The arc length of quadratic Bézier curves actually can be computed with a closed form expression. It is also possible to compute the arc length \\(l(t)\\) up to some point on the curve given by the parameter \\(t\\). However, oftentimes you want to have an arc length parametrization, that is a parametrization that maps a parameter \\(s\\) to the point on the curve that is an arc length of \\(s\\) apart from the start. That amounts to computing the inverse of \\(l(t)\\). The arc length parametrization of a quadratic Bézier is also generally accepted to have no closed form solution, but I've also not seen a proof for that before.

In this post, I will show that, assuming Schanuel's conjecture, indeed no such formula exists.
Don't worry if you're not so deep into abstract math, I'm basically applying some substitutions to bring the relevant expression into a form where I can use a known result. Also, I'm trying my best to make this post easy to follow. I'm assuming you know how to do calculations like integration, and how to use the exponential function \\(\exp\\) and the natural logarithm \\(\log\\), though.

# But how to prove that?

At first glance, I had no idea how to tackle that.
I've learned some Galois theory, which enables you to prove that a polynomial has no solution in radicals (the nth roots), but that is clearly not immediately applicable here. Hence, I used my favorite search engine and found this: https://math.stackexchange.com/a/4223360.
I was delighted that someone gave such a nice overview over the topic and started to look into the papers by Lin and Chow. Chow actually used Lin's result to prove there is no closed form solution for \\(x+e^x = 0\\) and then proves that polynomials which can't be solved by radicals also can't be solved by using \\(\log\\) and \\(\exp\\). All those results are conditional, though and assume Schanuel's conjecture.

Schanuel's conjecture is widely believed to be true, but seems pretty hard to prove.
It basically says that there is no nontrivial polynomial relationship between the numbers \\(\alpha\\) and
\\(e^\alpha\\). For all the details, see [Wikipedia](https://en.wikipedia.org/wiki/Schanuel%27s_conjecture).

Looking at Lin's result, I thought it looked promising for proving the nonexistence of a closed form arc length parametrization. Of course, it's a bummer that it depends on an unproven conjecture, but well.
I will resort to accepting Schanuel's conjecture to be true, otherwise the desired result is probably out of reach.

OK, let's start digging into the math:

# Some prerequisites

First of all, \\(\mathbb{Q}\\) are the **rational numbers**: all numbers that can be expressed as a fraction of two integers, for example: \\(\frac{1}{2}\\), \\(-\frac{3}{2}\\), \\(5=\frac{5}{1}\\), and so on.

Next we have the **polynomials** over \\(\mathbb{Q}\\):
The polynomials in one variable \\(x\\) are denoted by \\(\mathbb{Q}[x]\\), examples include: \\(x^2+1\\) or \\(x^3-\frac{x}{2}+\frac{1}{5}\\). Additionally, \\(\mathbb{Q}[x,y]\\)  are the polynomials in the two variables \\(x\\) and \\(y\\), like \\(x^2+y^2-1\\) or \\(\frac{x+y}{2}\\).

A polynomial \\(p\\) is called **irreducible**, if there are no non-constant polynomials \\(f\\) and \\(\\)g
such that \\(p = f \cdot g\\). The irreducible polynomials can be seen as an analog of prime numbers for polynomials.

Now, let's take a look at the **algebraic numbers** \\(\overline{\mathbb{Q}}\\): all numbers that are roots of a polynomial with rational coefficients. This includes all rational numbers: Let \\(a \in \mathbb{Q}\\), then \\(\\)a
is trivially the root of the polynomial \\(x-a\\). But it also includes a lot of irrational numbers, like \\(\sqrt{2}\\) which is the root of \\(x^2-2\\). It also includes the imaginary unit \\(i\\), which is the solution of \\(x^2+1\\). If you're not familiar with \\(i\\), take a look at the [complex numbers](https://en.wikipedia.org/wiki/Complex_number). They may seem a bit weird at first glance, but actually make things easier in a lot of cases.

The algebraic numbers do not contain \\(\pi\\) and \\(e\\), though.
Proving that isn't easy. The famous problem of squaring the circle asks whether \\(\pi\\) is in a certain subset of the algebraic numbers.
It was posed by ancient Greek mathematicians and was solved only in 1882 by Lindemann who showed that \\(\pi\\) is not algebraic.
Still, it is unproven that \\(\pi + e\\) is not algebraic, although pretty much everyone thinks so.
There are a lot of similar examples, and a positive resolution to Schanuel's conjecture would settle all of them.

We define the **closed form numbers** \\(\mathbb{E}\\) as those you get when you start with rational numbers and are allowed to apply addition, subtraction, multiplication, division and application of \\(\exp\\) or \\(\log\\) arbitrarily often. Take a look at Chow's paper if you want to have this definition more formal.
The closed form numbers include all algebraic numbers expressible as radicals:
\\[\sqrt[n]{a}=a^{\frac{1}{n}}=e^{\log(a) \cdot \frac{1}{n}}=\exp\left(\frac{\log(a)}{n}\right)\\]
They also include \\(i=\sqrt{-1}\\), as well as \\(e = \exp(1)\\) and \\(\pi = -i\log(-1)\\).
Generally, the closed form numbers according to this definition capture pretty much every values you can compute without resorting to numerical approximation methods like [Newton's method](https://en.wikipedia.org/wiki/Newton%27s_method).
I'll give a few more examples in case you're not yet convinced of this:
If \\(x\\) is a closed form number, then \\(\sin(x)\\) is also a closed form number:
\\[
\sin(x) = \frac{\exp(ix) - \exp(-ix)}{2i}
\\]
Similarly, we get:
\\[
\tanh(x) = \frac{\exp(x)-\exp(-x)}{\exp(x)+\exp(-x)}
\\]
and:
\\[
\text{acos}(x) = -i \log\left(x+\exp\left(\frac{\log(x^2-1)}{2}\right)\right)
\\]

We call such functions, that map closed form numbers to closed form numbers by only using allowed operations **closed form functions**.

Not all numbers in \\(\overline{\mathbb{Q}}\\) can be expressed in closed form. The 5 roots of \\(2x^5-10x+5\\) are algebraic by definition, but can be shown using Galois theory to not be expressible by radicals. Chow showed that they can't be expressed in closed form conditional on Schanuel's conjecture. Khovanskii was later able to show this unconditionally.

Lastly, the definition of **elementary numbers** \\(\mathbb{L}\\) is similar to the definition of closed form numbers, but we are now also allowed to get the roots of polynomials. \\(\mathbb{L}\\) clearly contains all algebraic numbers as well as all closed form numbers.

{{< figure src="/elementary_numbers_venn_diagram.svg" class="mid" caption="An overview over the numbers we defined" >}}

We now have everything in place to state Lin's result.

### Lin's theorem

If Schanuel's conjecture is true and \\(F(x,y) \in \overline{\mathbb{Q}}[x,y]\\) is an irreducible polynomial involving both \\(x\\) and \\(y\\) and \\(f(\alpha, e^\alpha) = 0\\) for some \\(\alpha \in \mathbb{C}\\), then either \\(\alpha = 0\\) or \\(\alpha \notin \mathbb{L}\\).

Let's give an example: Let \\(F(x,y) = x+y\\). Then \\(F(x,y) \in \mathbb{Q}\\) is irreducible and contains both \\(x\\) and \\(y\\).
Thus, if \\(\alpha\\) satisfies \\[F(\alpha,\exp(\alpha))=\alpha+\exp(\alpha)=0,\\] then \\(\alpha\\) is not an elementary number.
Hereby, you can prove that \\(f(x)=x+\exp(x)\\) has no closed form inverse:
Suppose \\(f^{-1}\\) was a closed form function, then \\(\alpha = f^{-1}(0)\\) would be a closed form number, contradicting Lin's theorem.

We can reformulate Lin's result slightly by noting that \\(\alpha\\) is elementary if and only if \\(\log(\alpha)\\) is elementary:
Just substitute \\(\alpha\\) with \\(\log(\alpha)\\) and switch \\(x\\) and \\(y\\).

### Variant of Lin's theorem
If Schanuel's conjecture is true and \\(F(x,y) \in \overline{\mathbb{Q}}[x,y]\\) is an irreducible polynomial involving both \\(x\\) and \\(y\\) and \\(f(\alpha, \log(\alpha)) = 0\\) for some \\(\alpha \in \mathbb{C}\\), then either \\(\alpha = 1\\) or \\(\alpha \notin \mathbb{L}\\).

I hope I haven't lost you yet :D

So how does any of this apply to quadratic Bézier curves?
Let's start by stating what we would like to have if it was possible:

We want to have a closed form formula, that given the control points of any quadratic Bézier curve and any parameter \\(s\\), computes a point on the curve that is exactly an arc length \\(s\\) apart from the starting point. I will show this to be impossible, by giving a single curve and parameter \\(s\\) such that it's impossible. I didn't need to try a lot of curves to find one where the proof works, I just took a curve which makes the involved mathematical expressions small.

# The proof

{{< figure src="/quadratic_bezier.svg" class="mid" caption="Our quadratic Bézier curve" >}}

I'm taking the control points to be
\\[
p_0=\begin{pmatrix}0\\\0\end{pmatrix}, \\,
p_1=\begin{pmatrix}\frac{1}{2}\\\0\end{pmatrix}, \\,
p_1=\begin{pmatrix}1\\\ \frac{1}{2}\end{pmatrix}
\\]
Which leads to the \\(x\\) and \\(y\\) coordinates of the curve points at parameter \\(t\\) being:
\\[
\begin{aligned}
x(t) &= t \\\
y(t) &= \frac{t^2}{2}
\end{aligned}
\\]
The arc length of the curve is given by the integral over the length of the tangent:
\\[
\begin{aligned}
f(t) &= \int_0^t \sqrt{x'(s)^2+y'(s)^2} \\: \mathrm{d}s \\\
&= \int_0^t \sqrt{s^2+1} \\: \mathrm{d}s \\\
&= \frac{1}{2} \left(\\, t \cdot \sqrt{t^{2} + 1} + \operatorname{arsinh}\left(t\right)\right) \\\
&= \frac{1}{2} \left(\\, t \cdot \sqrt{t^{2} + 1} + \log\left(t + \sqrt{t^2+1}\right)\right)
\end{aligned}
\\]

We now want to get rid of the expression inside the logarithm, in order to be able to apply Lin's theorem.
We define \\(\varphi(t) = t + \sqrt{t^2+1}\\) and get the inverse \\(\varphi^{-1}(t) = \frac{t^2-1}{2t}\\).
By substituting \\(t\\) with \\(\varphi^{-1}(x)\\) and multiplying with \\(2\\) we get:
\\[
2 \cdot f(\varphi^{-1}(x)) = \frac{x^4-1}{2x} + \log(x)
\\]
We multiply with \\(2x\\) to get:
\\[
4x \cdot f(\varphi^{-1}(x)) = x^4 + 2x \cdot \log(x) -1
\\]

We are now in the situation where we can apply Lin's result: Define \\(F(x,y) = x^4+2xy -1 \in \overline{\mathbb{Q}}[x,y]\\).
For checking the irreducibility, I just use [sage](https://www.sagemath.org/):
```sage
sage: R.<x,y> = QQbar[]
sage: factor(x^4+2*x*y+1)
x^4 + 2*x*y + 1
```
Since \\(F\\) is irreducible, we get that any \\(\alpha\\) with \\(F(\alpha, \log(\alpha))\\) is \\(1\\) or nonelementary. Let's check if it could be 1:
\\[
1^4+2\cdot 1 \cdot \log(1) - 1 = 1 + 2 \cdot 0 - 1 = 0
\\]
OK, shit. This is not going as planned. I wanted to show that the solution is nonelementary, but it turns out to just be 1.
Let's try to fix that. How about another substitution? If we substitute \\(x\\) with \\(2x\\), we get:
\\[
\begin{aligned}
8x \cdot f(\varphi^{-1}(2x)) &= 16x^4 + 4x \cdot \log(2x) - 1 \\\
\iff 8x \cdot f(\varphi^{-1}(2x)) &= 16x^4 + 4x \cdot \log(x)+4x \log(2) - 1 \\\
\iff 8x \cdot f(\varphi^{-1}(2x)) - 4x \log(2)&= 16x^4 + 4x \cdot \log(x) - 1
\end{aligned}
\\]
Now define \\(G(x,y) = 16x^4+4xy-1\\). This is irreducible as well. Let's check for the special case of \\(\alpha = 1\\) again.
\\[
16 \cdot 1^4+4\cdot 1 \cdot \log(1) - 1 = 16 + 2 \cdot 0 - 1 = 15
\\]
Nice, \\(1\\) is no solution this time. So let \\(\alpha\\) be a number such that \\[G(\alpha,\log(\alpha))=16\alpha^4 + 4x \cdot \log(\alpha) - 1=0.\\]
Then, by our variant of Lin's Theorem, \\(\alpha \notin \mathbb{L}\\). Therefore, \\(\alpha \notin \mathbb{E}\\).

Since \\(G(\alpha, \log(\alpha))=0\\), by the above equation we get:
\\[
\begin{aligned}
8\alpha \cdot f(\varphi^{-1}(2\alpha)) - 4\alpha \log(2) &= 0 \\\
\iff 8\alpha \cdot f(\varphi^{-1}(2\alpha)) &= 4\alpha \log(2) \\\
\iff 2\alpha \cdot f(\varphi^{-1}(2\alpha)) &= \alpha \log(2)
\end{aligned}
\\]
Clearly \\(\alpha \neq 0\\) since \\(\alpha \notin \mathbb{E}\\), so we can divide by \\(\alpha\\):
\\[
\begin{aligned}
2 \cdot f(\varphi^{-1}(2\alpha)) &= \log(2) \\\
f(\varphi^{-1}(2\alpha)) &= \frac{\log(2)}{2} \\\
\varphi^{-1}(2\alpha) &= f^{-1}\left(\frac{\log(2)}{2}\right) \\\
2\alpha &= \varphi\left(f^{-1}\left(\frac{\log(2)}{2}\right)\right) \\\
\alpha &= \frac{\varphi\left(f^{-1}\left(\frac{\log(2)}{2}\right)\right)}{2} \\\
\end{aligned}
\\]

Since \\(\varphi\\) is a closed form function, if \\(f^{-1}\\) was a closed form function,
\\(\alpha\\) would be a closed form number. But this is a contradiction to the fact that \\(\alpha\\) is not a closed form number by Lin's theorem and the assumption that Schanuel's conjecture is true.
Therefore, \\(f^{-1}\\) is not a closed form function, which is what we wanted to show.

Of course, we can compute \\(f^{-1}\\) and \\(\alpha\\) numerically, for example using Newton's method.
So, if you're curious, we get: \\(\alpha \approx 0.609440243339721\\).

### References

[Ferng-Chin Lin 1983: Schanuel's conjecture implies Ritt's conjectures](https://www.jstor.org/stable/43836165)
[Timothy Chow 1999: What is a closed form number](http://timothychow.net/closedform.pdf)
