local rule = {
    matches = {
        {
            { "object.path", "equals", "alsa:pcm:0:front:0:capture" },
        },
    },
    apply_properties = {
        ["node.description"] = "System Mic",
        ["node.nick"] = "System Mic"
    },
}

table.insert(alsa_monitor.rules, rule)
