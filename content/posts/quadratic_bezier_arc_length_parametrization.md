+++
title = "Bézier curve arc length parametrizations"
description = ""
tags = [
    "bézier",
    "schanuel conjecture",
    "closed form",
]
date = "2024-07-15"
categories = [
    "proofs"
]
images = ""
+++

# Bézier curves
Bézier curves are widely used for defining vector graphics. They are basically polynomial parametric curves, but in the Bernstein basis, which enables us to define the curve using start and end points and control points which kind of bend the curve. The two types of bézier curves which are generally used are quadratic and cubic bézier curves. Quadratic bézier curves have one control point, cubic bézier curves have three. If you want to know more, [wikipedia](https://en.wikipedia.org/wiki/B%C3%A9zier_curve) is a good starting point.

# Arc lengths
The arc length of a curve is the distance traveled when going from the start to the end.
It is well known in the computer graphics community that the arc length of cubic bezier curves has no closed form and has to be computed numerically. Sadly, i've not yet seen a proof sketch for that, though. Most people just link to the Abel-Ruffini theorem, but that is not directly applicable as far as i know. I'll leave the challenge of proving that to a later post and deal with the quadratic bézier curves for now. The arc length of quadratic bézier curves actually can be computed with a closed form expression. However, oftentimes you want to have an arc length parametrization, that is a parametrization that maps a parameter $t$ to the point on the curve that is an arc length of $t$ apart from the start. That amounts to computing the inverse of the arc length formula. The inverse of the arc length of a quadratic bézier is also generally accepted to have no closed form solution, but i've also not seen a proof for that before.

In this post, i will show that, assuming the Schanuel conjecture, indeed no such formula exists.
Don't worry if you're not so deep into abstract math, i'm basically applying some substitutions to bring the relevant expression into a form where i can use a known result. Also, i'm trying my best to make this post easy to follow. I'm assuming you know how to do calculations like integration, and how to use $\exp$ and $\log$, though.

# But how to prove that?

At first glance, i had no idea how to tackle that.
I've learned some Galois Theory, which enables you to prove that a polynomial has no solution in radicals (like the Abel-Ruffini Theorem mentioned above), but that is clearly not immediately applicable here. Hence, i used my favorite search engine and found this: https://math.stackexchange.com/a/4223360.
I was delighted that someone gave such a nice overview over the topic and started to look into the papers by Lin and Chow. Chow actually used Lin's result to prove there is no closed form solution for $x+e^x = 0$ and then proves that polynomials which can't be solved by radicals also can't be solved by using $\log$ and $\exp$. All those results are conditional, though and assume Schanuel's conjecture.

Schanuel's conjecture is widely believed to be true, but seems pretty hard to proof.
It basically says that there is no unexpected polynomial relationship between the numbers $\alpha$ and
$e^\alpha$. For all the details, see [wikipedia](https://en.wikipedia.org/wiki/Schanuel%27s_conjecture).

Looking at Lin's result, i thought it looked promising for proving the nonexistence of a closed form arc length parametrization. Of course, it's a bummer that it depends on an unproven conjecture, but well.

OK, let's start digging into the math:

# Some prerequisites

First of all, $\mathbb{Q}$ are the **rational numbers**: all numbers that can be expressed as a fraction of two integers, for example: $\frac{1}{2}$, $-\frac{3}{2}$, $5=\frac{5}{1}$, and so on.

Next we have the **polynomials** over $\mathbb{Q}$:
We have the univariate polynomials $\mathbb{Q}[x]$, for example: $x^2+1$ or $x^3-\frac{x}{2}+\frac{1}{5}$. Then we have the bivariate polynomials $\mathbb{Q}[x,y]$, like $x^2+y^2-1$ or $\frac{x+y}{2}$.
A polynomial $p$ is called **irreducible**, if there are no non-constant polynomials $f$ and $g$
such that $p = f \cdot g$. The irreducible polynomials can be seen as an analogon of prime numbers for polynomials.

Now, let's take a look at the **algebraic numbers** $\overline{\mathbb{Q}}$: all numbers that are roots of a polynomial with rational coefficients. This includes all rational numbers: Let $a \in \mathbb{Q}$, then $a$
is trivially the root of the polynomial $x-a$. But it also includes a lot of irrational numbers, like $\sqrt{2}$ which is the root of $x^2-2$. It also includes the imaginary unit $i$, which is the solution of $x^2+1$. If you're not familiar with $i$, take a look at the [complex numbers](https://en.wikipedia.org/wiki/Complex_number). They may seem a bit weird at first glance, but actually make things easier in a lot of cases.

The algebraic numbers do not contain $\pi$ and $e$, though.

We define the **closed form numbers** $\mathbb{E}$ as the smallest set of numbers that contains the rational numbers and is closed under addition, subtraction, multiplication, division and application of $\exp$ or $\log$. Take a look at Chow's paper if you want to have this definition a bit more formal.
The closed form numbers include all algebraic numbers expressible as radicals:
$$\sqrt[n]{a}=a^{\frac{1}{n}}=e^{\log(a) \cdot \frac{1}{n}}=\exp\left(\frac{\log(a)}{n}\right)$$
They also include $i=\sqrt[2]{-1}$, as well as $e = \exp(1)$ and $\pi = \frac{\log(-1)}{i}$.

Not all numbers in $\overline{\mathbb{Q}}$ can be expressed in closed form. The 5 roots of $2x^5-10x+5$ are algebraic by definition, but can be shown using Galois Theory to not be expressible by radicals. Chow showed that they can't be expressed in closed form conditional on Schanuel's conjecture. Khovanskii was later able to show this unconditionally.

Lastly, we define the **elementary numbers** $\mathbb{L}$ as all numbers which are the root of a polynomial with closed form coefficients. $\mathbb{L}$ clearly contains all algebraic numbers as well as all closed form numbers.

We now have everything in place to state Lin's result.

### Lin's theorem

If Schanuel's conjecture is true and $f(x,y) \in \overline{\mathbb{Q}}[x,y]$ is an irreducible polynomial involving both $x$ and $y$ and $f(\alpha, e^\alpha) = 0$ for some $\alpha \in \mathbb{C}$, then either $\alpha = 0$ or $\alpha \notin \mathbb{L}$.

We can reformulate that slightly by noting that $\alpha$ is elementary if and only if $\log(\alpha)$ is elementary:

### Variant of Lin's theorem
If Schanuel's conjecture is true and $f(x,y) \in \overline{\mathbb{Q}}[x,y]$ is an irreducible polynomial involving both $x$ and $y$ and $f(\alpha, \log(\alpha)) = 0$ for some $\alpha \in \mathbb{C}$, then either $\alpha = 1$ or $\alpha \notin \mathbb{L}$.
