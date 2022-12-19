local rule = {
    matches = {
        {
            { "object.path", "equals", "alsa:pcm:0:front:0:playback" },
        },
    },
    apply_properties = {
        ["node.description"] = "System Speakers",
        ["node.nick"] = "System Speakers"
    },
}

table.insert(alsa_monitor.rules, rule)
