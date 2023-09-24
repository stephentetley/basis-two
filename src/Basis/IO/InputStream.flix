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
    /// Represents an InputStream.
    /// Abstract class
    ///
    pub enum InputStream[_: Region](##java.io.InputStream)

}

mod Basis.IO.InputStream {


    use Basis.IO.InputStream
    use Basis.IO.InputStream.{InputStream}

    /// Abstract / no constructors...

    pub def close!(s: InputStream[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.InputStream.close(): Unit \ r;
            let InputStream(s1) = s;
            close(s1)
        })


    pub def available(s: InputStream[r]): Result[String, Int32] \ r =
        Result.tryCatch(_ -> {
            import java.io.InputStream.available(): Int32 \ r;
            let InputStream(s1) = s;
            available(s1)
        })

    pub def reset!(s: InputStream[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.io.InputStream.reset(): Unit \ r;
            let InputStream(s1) = s;
            reset(s1)
        })

    pub def readByte!(s: InputStream[r]): Result[String, Int32] \ r =
        Result.tryCatch(_ -> {
            import java.io.InputStream.read(): Int32 \ r;
            let InputStream(s1) = s;
            read(s1)
        })

    pub def readArray!(buf: Array[Int8, r1], 
                        s: InputStream[r]): Result[String, Int32] \ {r, r1} =
        Result.tryCatch(_ -> {
            import java.io.InputStream.read(Array[Int8, r1]): Int32 \ {r, r1};
            let InputStream(s1) = s;
            read(s1, buf)
        })

    pub def readArrayWith!(destOffset: {destOffset = Int32}, 
                            length: {length = Int32}, 
                            buf: Array[Int8, r1], 
                            s: InputStream[r]): Result[String, Int32] \ {r, r1} =
        Result.tryCatch(_ -> {
            import java.io.InputStream.read(Array[Int8, r1], Int32, Int32): Int32 \ {r, r1};
            let InputStream(s1) = s;
            read(s1, buf, destOffset.destOffset, length.length)
        })

}
