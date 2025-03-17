import manim as m


class SquareToCircle(m.Scene):
    def construct(self):
        circle = m.Circle()
        circle.set_fill(m.PINK, opacity=0.5)

        square = m.Square()
        square.rotate(m.PI / 4)

        self.play(m.Create(square))
        self.play(m.Transform(square, circle))
        self.play(m.FadeOut(square))
