:orphan:

reStructuredText Cheat Sheet
=====================================

Math Extension
-------------------------------------

inline math.  Use like this :math:`a^2 + b^2 = c^2`.

Directive for displayed math (math that takes the whole line for itself).

The directive supports multiple equations,
which should be separated by a blank line:

.. math::

   (a + b)^2 = a^2 + 2ab + b^2

   (a - b)^2 = a^2 - 2ab + b^2

In addition, each single equation is set within a ``split`` environment,
which means that you can have multiple aligned lines in an equation,
aligned at ``&`` and separated by ``\\``：

.. math::

   (a + b)^2  &=  (a + b)(a + b) \\
              &=  a^2 + 2ab + b^2

For more details, look into the documentation of the `AmSMath LaTeX package`_.

.. _AmSMath LaTeX package: http://www.ams.org/publications/authors/tex/amslatex

When the math is only one line of text, it can also be given as a directive
argument：

.. math:: (a + b)^2 = a^2 + 2ab + b^2

Normally, equations are not numbered.  If you want your equation to get a
number, use the ``label`` option.  When given, it selects an internal label
for the equation, by which it can be cross-referenced, and causes an equation
number to be issued.  See :rst:role:`eqref` for an example.  The numbering
style depends on the output format.

There is also an option ``nowrap`` that prevents any wrapping of the given
math in a math environment.  When you give this option, you must make sure
yourself that the math is properly set up.  For example：

.. math::
   :nowrap:

   \begin{eqnarray}
      y    & = & ax^2 + bx + c \\
      f(x) & = & x^2 + 2xy + y^2
   \end{eqnarray}

.. math:: e^{i\pi} + 1 = 0
   :label: euler

Euler's identity, equation :eq:`euler`, was elected one of the most
beautiful mathematical formulas.

math demo:

.. math::

    \begin{equation*}
        \left.\begin{aligned}
            B'&=-\partial\times E,\\
            E'&=\partial\times B - 4\pi j,
        \end{aligned}\right\}
        \qquad \text{Maxwell's equations}
    \end{equation*}

.. math::

    P_{r-j}=\begin{cases}
        0& \text{if $r-j$ is odd},\\
        r!\,(-1)^{(r-j)/2}& \text{if $r-j$ is even}.
    \end{cases}

Math Char
-------------------------------------

