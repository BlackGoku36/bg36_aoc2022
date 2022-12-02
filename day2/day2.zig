const std = @import("std");

const round = struct {
    elf: u8,
    me: u8,
};

pub fn round1() anyerror!void {
    var file = try std.fs.cwd().openFile("input.txt", .{});
    defer file.close();

    var buffer: [2500]u8 = undefined;

    var score: u32 = 0;

    while (try file.reader().readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        var r = std.mem.split(u8, line, " ");

        var elf_handshape: u8 = r.first()[0];
        var me_handshape: u8 = r.next().?[0];

        if (elf_handshape == 'A') {
            if (me_handshape == 'X') {
                score += 1 + 3;
            } else if (me_handshape == 'Y') {
                score += 2 + 6;
            } else if (me_handshape == 'Z') {
                score += 3 + 0;
            }
        } else if (elf_handshape == 'B') {
            if (me_handshape == 'Y') {
                score += 2 + 3;
            } else if (me_handshape == 'Z') {
                score += 3 + 6;
            } else if (me_handshape == 'X') {
                score += 1 + 0;
            }
        } else if (elf_handshape == 'C') {
            if (me_handshape == 'Z') {
                score += 3 + 3;
            } else if (me_handshape == 'X') {
                score += 1 + 6;
            } else if (me_handshape == 'Y') {
                score += 2 + 0;
            }
        }
    }

    std.log.info("Round-1 score: {d}", .{score});
}

pub fn round2() anyerror!void {
    var file = try std.fs.cwd().openFile("input.txt", .{});
    defer file.close();

    var buffer: [2500]u8 = undefined;

    var score: u32 = 0;

    while (try file.reader().readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        var r = std.mem.split(u8, line, " ");

        var elf_handshape: u8 = r.first()[0];
        var me_handshape: u8 = r.next().?[0];

        if (elf_handshape == 'A') {
            // ROCK
            if (me_handshape == 'X') {
                score += 3 + 0;
            } else if (me_handshape == 'Y') {
                score += 1 + 3;
            } else if (me_handshape == 'Z') {
                score += 2 + 6;
            }
        } else if (elf_handshape == 'B') {
            // PAPER
            if (me_handshape == 'X') {
                score += 1 + 0;
            } else if (me_handshape == 'Y') {
                score += 2 + 3;
            } else if (me_handshape == 'Z') {
                score += 3 + 6;
            }
        } else if (elf_handshape == 'C') {
            // SCISSOR
            if (me_handshape == 'X') {
                score += 2 + 0;
            } else if (me_handshape == 'Y') {
                score += 3 + 3;
            } else if (me_handshape == 'Z') {
                score += 1 + 6;
            }
        }
    }

    std.log.info("Round-2 score: {d}", .{score});
}

pub fn main() anyerror!void {
    try round1();
    try round2();
}
