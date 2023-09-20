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
    /// Represents an InputStreamReader.
    ///
    pub enum InputStreamReader[_: Region](##java.io.InputStreamReader)

}

mod Basis.IO.InputStreamReader {


    use Basis.IO.InputStreamReader
    use Basis.IO.InputStreamReader.{InputStreamReader}
    use Basis.IO.InputStream
    use Basis.IO.InputStream.{InputStream}
    use Basis.IO.Reader
    use Basis.IO.Reader.{Reader}
    use Charset.{Charset}

    pub def new(s: InputStream[r]): InputStreamReader[r] \ r = 
        import new java.io.InputStreamReader(##java.io.InputStream): ##java.io.InputStreamReader \ r as newInputStreamReader;
        let InputStream(s1) = s;
        InputStreamReader(newInputStreamReader(s1))

    pub def newWithCharset(cs: Charset, s: InputStream[r]): InputStreamReader[r] \ r = 
        import new java.io.InputStreamReader(##java.io.InputStream, ##java.nio.charset.Charset): ##java.io.InputStreamReader \ r as newInputStreamReader;
        let InputStream(s1) = s;
        let Charset(cs1) = cs;
        InputStreamReader(newInputStreamReader(s1, cs1))

    pub def asReader(r: InputStreamReader[r]): Reader[r] \ r = 
        let InputStreamReader(r1) = r;
        checked_ecast(Reader(checked_cast(r1)))

    pub def close!(r: InputStreamReader[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.InputStreamReader.close(): Unit \ r;
            let InputStreamReader(r1) = r;
            close(r1)
        })

    pub def ready(r: InputStreamReader[r]): Result[String, Bool] \ r =
        Result.tryCatch(_ -> {
            import java.io.InputStreamReader.ready(): Bool \ r;
            let InputStreamReader(r1) = r;
            ready(r1)
        })

    pub def readChar!(r: InputStreamReader[r]): Result[String, Int32] \ r =
        Result.tryCatch(_ -> {
            import java.io.InputStreamReader.read(): Int32 \ r;
            let InputStreamReader(r1) = r;
            read(r1)
        })

    pub def readCharArray!(destOffset: {destOffset = Int32}, 
                            length: {length = Int32}, 
                            buf: Array[Char, r1], 
                            r: InputStreamReader[r]): Result[String, Int32] \ {r, r1} =
        Result.tryCatch(_ -> {
            import java.io.InputStreamReader.read(Array[Char, r1], Int32, Int32): Int32 \ {r, r1};
            let InputStreamReader(r1) = r;
            read(r1, buf, destOffset.destOffset, length.length)
        })

}
