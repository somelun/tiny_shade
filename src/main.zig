const std = @import("std");

const WIDTH = 150;
const HEIGHT = 50;

pub fn main() !void {
    // clear screen
    std.debug.print("\x1b[2J\x1b[H", .{});

    const array_size = (WIDTH + 1) * HEIGHT;
    var screen_array: [array_size]u8 = [_]u8{'s'} ** array_size;

    var i: usize = 1;
    while (i <= HEIGHT) : (i += 1) {
        screen_array[(i * WIDTH) + (i - 1)] = '\n';
    }

    while (true) {
        std.debug.print("\x1b[2J\x1b[H", .{});

        for (screen_array) |value| {
            std.debug.print("{u}", .{value});
        }
        std.debug.print("\n", .{});

        std.time.sleep(1 * std.time.ns_per_s);
    }
}
