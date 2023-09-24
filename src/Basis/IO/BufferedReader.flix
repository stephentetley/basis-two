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
    /// Represents a BufferedReader.
    ///
    pub enum BufferedReader[_: Region](##java.io.BufferedReader)

}

mod Basis.IO.BufferedReader {

    use Basis.IO.Reader
    use Basis.IO.Reader.{Reader}

    pub def new(r: Reader[r]): BufferedReader[r] \ r = 
        import new java.io.BufferedReader(##java.io.Reader): ##java.io.BufferedReader \ r as newBufferedReader;
        let Reader(r1) = r;
        BufferedReader(newBufferedReader(r1))

    pub def newWithSize(n: Int32, r: Reader[r]): Result[String, BufferedReader[r]] \ r = 
        Result.tryCatch(_ -> {
            import new java.io.BufferedReader(##java.io.Reader, Int32): ##java.io.BufferedReader \ r as newBufferedReader;
            let Reader(r1) = r;
            BufferedReader(newBufferedReader(r1, n))
        })


    pub def close!(r: BufferedReader[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.BufferedReader.close(): Unit \ r;
            let BufferedReader(r1) = r;
            close(r1)
        })

    pub def ready(r: BufferedReader[r]): Result[String, Bool] \ r =
        Result.tryCatch(_ -> {
            import java.io.BufferedReader.ready(): Bool \ r;
            let BufferedReader(r1) = r;
            ready(r1)
        })

    pub def reset!(r: BufferedReader[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.BufferedReader.reset(): Unit \ r;
            let BufferedReader(r1) = r;
            reset(r1)
        })

    pub def readChar!(r: BufferedReader[r]): Result[String, Int32] \ r =
        Result.tryCatch(_ -> {
            import java.io.BufferedReader.read(): Int32 \ r;
            let BufferedReader(r1) = r;
            read(r1)
        })

    pub def readLine!(r: BufferedReader[r]): Result[String, String] \ r =
        Result.tryCatch(_ -> {
            import java.io.BufferedReader.readLine(): String \ r;
            let BufferedReader(r1) = r;
            readLine(r1)
        })

}
