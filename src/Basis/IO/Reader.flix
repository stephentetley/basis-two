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
    /// Represents a Reader.
    /// Abstract class
    ///
    pub enum Reader[_: Region](##java.io.Reader)

}

mod Basis.IO.Reader {


    /// Abstract / no constructors...
    
    pub def close!(r: Reader[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.Reader.close(): Unit \ r;
            let Reader(r1) = r;
            close(r1)
        })

    pub def ready(r: Reader[r]): Result[String, Bool] \ r =
        Result.tryCatch(_ -> {
            import java.io.Reader.ready(): Bool \ r;
            let Reader(r1) = r;
            ready(r1)
        })

    pub def reset!(r: Reader[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.Reader.reset(): Unit \ r;
            let Reader(r1) = r;
            reset(r1)
        })

    pub def readChar!(r: Reader[r]): Result[String, Int32] \ r =
        Result.tryCatch(_ -> {
            import java.io.Reader.read(): Int32 \ r;
            let Reader(r1) = r;
            read(r1)
        })


    pub def readCharArray!(destOffset: {destOffset = Int32}, 
                            length: {length = Int32}, 
                            buf: Array[Char, r1], 
                            r: Reader[r]): Result[String, Int32] \ {r, r1} =
        Result.tryCatch(_ -> {
            import java.io.Reader.read(Array[Char, r1], Int32, Int32): Int32 \ {r, r1};
            let Reader(r1) = r;
            read(r1, buf, destOffset.destOffset, length.length)
        })


    pub def skip!(n: Int64, r: Reader[r]): Result[String, Int64] \ r = 
        Result.tryCatch(_ -> {
            import java.io.Reader.skip(Int64): Int64 \ r;
            let Reader(r1) = r;
            skip(r1, n)
        })

}
