import manim as m


class MyScene(m.Scene):
    def construct(self):
        line1 = m.Text(
            "Exploration Throughput is\nis longitudinal",
            font_size=26,
            font="Brush Script MT",
            # slant=m.ITALIC,
        ).move_to([4.5, -2.5, 0])
        # line2 = m.Text("is longitudinal.", font_size=26).move_to([4.5, -3.5, 0])
        self.play(m.Write(line1))
