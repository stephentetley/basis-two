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
    /// Represents a BufferedWriter.
    ///
    pub enum BufferedWriter[_: Region](##java.io.BufferedWriter)

}

mod Basis.IO.BufferedWriter {

    use Basis.IO.Writer
    use Basis.IO.Writer.{Writer}

    pub def new(w: Writer[r]): BufferedWriter[r] \ r = 
        import new java.io.BufferedWriter(##java.io.Writer): ##java.io.BufferedWriter \ r as newBufferedWriter;
        let Writer(w1) = w;
        BufferedWriter(newBufferedWriter(w1))

    pub def newWithSize(n: Int32, w: Writer[r]): Result[String, BufferedWriter[r]] \ r = 
        Result.tryCatch(_ -> {
            import new java.io.BufferedWriter(##java.io.Writer, Int32): ##java.io.BufferedWriter \ r as newBufferedWriter;
            let Writer(w1) = w;
            BufferedWriter(newBufferedWriter(w1, n))
        })


    pub def close!(w: BufferedWriter[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.BufferedWriter.close(): Unit \ r;
            let BufferedWriter(w1) = w;
            close(w1)
        })

    pub def flush!(w: BufferedWriter[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.BufferedWriter.close(): Unit \ r;
            let BufferedWriter(w1) = w;
            close(w1)
        })

    pub def newLine!(w: BufferedWriter[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.BufferedWriter.newLine(): Unit \ r;
            let BufferedWriter(w1) = w;
            newLine(w1)
        })
}
