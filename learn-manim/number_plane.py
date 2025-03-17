import manim as m
import numpy as np


class NumberPlaneExample(m.Scene):
    def construct(self):
        start_number_plane = m.NumberPlane(
            x_range=[-1, 2, 1],
            y_range=[-1, 5, 1],
            x_length=12 / 7,
            y_length=4.0,
            background_line_style={
                "stroke_color": m.TEAL,
                "stroke_width": 2,
                "stroke_opacity": 0.3,
            },
            y_axis_config={
                "include_ticks": True,
                "include_numbers": True,
                "numbers_to_exclude": [-1],
            },
            x_axis_config={
                "include_ticks": True,
                "include_numbers": True,
                "numbers_to_exclude": [-1, 2],
            },
        )
        start_number_plane.move_to([-6, 1.75, 0])
        points = start_number_plane.points
        points = np.roll(points, int(len(points) / 4), axis=0)
        start_number_plane.points = points

        number_plane = m.NumberPlane(
            x_range=[-1, 11, 1],
            y_range=[-1, 5, 1],
            x_length=7.0,
            y_length=4.0,
            background_line_style={
                "stroke_color": m.TEAL,
                "stroke_width": 2,
                "stroke_opacity": 0.3,
            },
            axis_config={
                "include_ticks": True,
                "include_numbers": True,
                "numbers_to_exclude": [-1],
            },
        )
        number_plane.move_to([-3.22, 1.75, 0])
        self.play(m.Transform(start_number_plane, number_plane))
        # self.add(start_number_plane, number_plane)
