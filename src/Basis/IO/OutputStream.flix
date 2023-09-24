/*
 * Copyright 2023 Stephen Tetley
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


mod Basis.IO {

    ///
    /// Represents an OutputStream.
    /// Abstract class
    ///
    pub enum OutputStream[_: Region](##java.io.OutputStream)

}

mod Basis.IO.OutputStream {


    use Basis.IO.OutputStream
    use Basis.IO.OutputStream.{OutputStream}

    /// Abstract / no constructors...

    pub def close!(s: OutputStream[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.OutputStream.close(): Unit \ r;
            let OutputStream(s1) = s;
            close(s1)
        })

    pub def writeByte!(b: Int32, s: OutputStream[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.io.OutputStream.write(Int32): Unit \ r;
            let OutputStream(s1) = s;
            write(s1, b)
        })

    pub def writeArray!(buf: Array[Int8, r1], 
                        s: OutputStream[r]): Result[String, Unit] \ {r, r1} =
        Result.tryCatch(_ -> {
            import java.io.OutputStream.write(Array[Int8, r1]): Unit \ {r, r1};
            let OutputStream(s1) = s;
            write(s1, buf)
        })

    pub def writeArrayWith!(destOffset: {destOffset = Int32}, 
                            length: {length = Int32}, 
                            buf: Array[Int8, r1], 
                            s: OutputStream[r]): Result[String, Unit] \ {r, r1} =
        Result.tryCatch(_ -> {
            import java.io.OutputStream.write(Array[Int8, r1], Int32, Int32): Unit \ {r, r1};
            let OutputStream(s1) = s;
            write(s1, buf, destOffset.destOffset, length.length)
        })

}
