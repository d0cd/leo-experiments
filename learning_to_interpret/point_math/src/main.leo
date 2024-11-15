program point_math.aleo {
    record Point {
        owner: address,
        x: u32,
        y: u32,
    }

    // Create a new point.
    transition create_point(x: u32, y: u32) -> Point {
        return Point {
            owner: self.caller,
            x: x,
            y: y
        };
    }

    // Add two points.
    transition add_points(p1: Point, p2: Point) -> Point {
        return Point {
            owner: p1.owner,
            x: p1.x + p2.x,
            y: p1.y + p2.y
        };
    }

    // Calculate the distance between two points.
    transition distance(p1: Point, p2: Point) -> u32 {
        let x_diff: u32 = p1.x - p2.x;
        let y_diff: u32 = p1.y - p2.y;
        return sqrt_bitwise(x_diff * x_diff + y_diff * y_diff);
    }

    // An implementation of integer square root.
    function sqrt_bitwise(n: u32) -> u32 {
        let (result, bit): (u32, u32) = (0u32, 1u32 << 30u8);
        for i: u32 in 0u32..16u32 {
            bit >>= ((bit > n) as u32) * 2u32;
            if n >= result + bit {
                n -= result + bit;
                result = (result >> 1u32) + bit;
            } else {
                result >>= 1u32;
            }
        }
        return result;
    }
    
}
