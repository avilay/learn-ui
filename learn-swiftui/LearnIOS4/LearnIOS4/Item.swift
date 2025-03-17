//
//  DataModel.swift
//  LearnIOS4
//
//  Created by Avilay Parekh on 7/3/23.
//

import Foundation

struct ItemThree: Identifiable, Hashable {
    var id: UUID = UUID()
    var label: String
}

struct ItemTwo: Identifiable, Hashable {
    var id: UUID = UUID()
    var title: String
    var details: String
    var threes: [ItemThree]
}

struct ItemOne: Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
    var desc: String
    var items: [ItemTwo]
}

func genData() -> [ItemOne] {
    return [
        ItemOne(
            name: "lively-lake",
            desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            items: [
                ItemTwo(
                    title: "dry-paper",
                    details: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    threes: [
                        ItemThree(label: "jolly-waterfall-5227"),
                        ItemThree(label: "frosty-wave-2199")
                    ]
                
                ),
                ItemTwo(
                    title: "raspy-sun",
                    details: "ed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque.",
                    threes: [
                        ItemThree(label: "holy-breeze-9968"),
                        ItemThree(label: "flat-forest-7908"),
                        ItemThree(label: "lively-heart-0015")
                    ]
                ),
                ItemTwo(
                    title: "blue-shadow",
                    details: "ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                    threes: [
                        ItemThree(label: "fancy-darkness-6969"),
                        ItemThree(label: "orange-fire-1981")
                    ]
                )
            ]
        ),
        ItemOne(
            name: "little-limit",
            desc: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            items: [
                ItemTwo(
                    title: "holy-fog",
                    details: "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores.",
                    threes: [
                        ItemThree(label: "lingering-butterfly-7140"),
                        ItemThree(label: "ancient-term-9015")
                    ]
                ),
                ItemTwo(
                    title: "fall-butterfly",
                    details: "eos qui ratione voluptatem sequi nesciunt.",
                    threes: [
                        ItemThree(label: "proud-lab-8775"),
                        ItemThree(label: "sweet-sound-6390")
                    ]
                )
            ]
        ),
        ItemOne(
            name: "nice-dust",
            desc: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
            items: [
                ItemTwo(
                    title: "twilight-wildflower",
                    details: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet",
                    threes: [
                        ItemThree(label: "wild-poetry-4956"),
                        ItemThree(label: "divine-paper-6557")
                    ]
                ),
                ItemTwo(
                    title: "sparkling-mouse",
                    details: "consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore",
                    threes: [
                        ItemThree(label: "little-butterfly-1981")
                    ]
                ),
                ItemTwo(
                    title: "fine-mode",
                    details: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis",
                    threes: [
                        ItemThree(label: "young-night-9383")
                    ]
                ),
                ItemTwo(
                    title: "gentle-glitter",
                    details: "suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?",
                    threes: [
                        ItemThree(label: "misty-sea-6281")
                    ]
                )
            ]
        )
    ]
}
