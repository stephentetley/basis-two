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
    /// Represents a Writer.
    ///
    pub enum Writer[_: Region](##java.io.Writer)

}

mod Basis.IO.Writer {


    pub def close!(w: Writer[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.Writer.close(): Unit \ r;
            let Writer(w1) = w;
            close(w1)
        })

    pub def flush!(w: Writer[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.Writer.close(): Unit \ r;
            let Writer(w1) = w;
            close(w1)
        })

    pub def appendChar!(c: Char, w: Writer[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.Writer.append(Char): ##java.io.Writer \ r;
            let Writer(w1) = w;
            discard append(w1, c)
        })

    pub def writeString!(s: String, w: Writer[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.Writer.write(String): Unit \ r;
            let Writer(w1) = w;
            write(w1, s)
        })

    pub def writeStringWith!(sourceOffset: {sourceOffset = Int32}, 
                            length: {length = Int32}, 
                            s: String, w: Writer[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.Writer.write(String, Int32, Int32): Unit \ r;
            let Writer(w1) = w;
            write(w1, s, sourceOffset.sourceOffset, length.length)
        })

}
