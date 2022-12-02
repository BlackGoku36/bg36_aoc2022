const std = @import("std");

const round = struct {
    elf: u8,
    me: u8,
};

pub fn round1(rounds: []round) anyerror!void {
    var score: u32 = 0;

    for (rounds) |handshape| {
        const elf = handshape.elf;
        const me = handshape.me;

        if (elf == 'A') {
            if (me == 'X') {
                score += 1 + 3;
            } else if (me == 'Y') {
                score += 2 + 6;
            } else if (me == 'Z') {
                score += 3 + 0;
            }
        } else if (elf == 'B') {
            if (me == 'Y') {
                score += 2 + 3;
            } else if (me == 'Z') {
                score += 3 + 6;
            } else if (me == 'X') {
                score += 1 + 0;
            }
        } else if (elf == 'C') {
            if (me == 'Z') {
                score += 3 + 3;
            } else if (me == 'X') {
                score += 1 + 6;
            } else if (me == 'Y') {
                score += 2 + 0;
            }
        }
    }

    std.log.info("Round-1 score: {d}", .{score});
}

pub fn round2(rounds: []round) anyerror!void {
    var score: u32 = 0;

    for (rounds) |handshape| {
        const elf = handshape.elf;
        const me = handshape.me;
        if (elf == 'A') {
            // ROCK
            if (me == 'X') {
                score += 3 + 0;
            } else if (me == 'Y') {
                score += 1 + 3;
            } else if (me == 'Z') {
                score += 2 + 6;
            }
        } else if (elf == 'B') {
            // PAPER
            if (me == 'X') {
                score += 1 + 0;
            } else if (me == 'Y') {
                score += 2 + 3;
            } else if (me == 'Z') {
                score += 3 + 6;
            }
        } else if (elf == 'C') {
            // SCISSOR
            if (me == 'X') {
                score += 2 + 0;
            } else if (me == 'Y') {
                score += 3 + 3;
            } else if (me == 'Z') {
                score += 1 + 6;
            }
        }
    }

    std.log.info("Round-2 score: {d}", .{score});
}

pub fn main() anyerror!void {
    var file = try std.fs.cwd().openFile("input.txt", .{});
    defer file.close();

    var buffer: [2500]u8 = undefined;

    var rounds: [2500]round = undefined;

    var i: u32 = 0;
    while (try file.reader().readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        var r = std.mem.split(u8, line, " ");

        var elf_handshape: u8 = r.first()[0];
        var me_handshape: u8 = r.next().?[0];

        rounds[i].elf = elf_handshape;
        rounds[i].me = me_handshape;

        i += 1;
    }

    try round1(&rounds);
    try round2(&rounds);
}
