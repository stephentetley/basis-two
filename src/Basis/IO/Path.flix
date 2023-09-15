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
    /// Represents a Path.
    /// Interface / Immutable
    pub enum Path(##java.nio.file.Path)

    instance ToString[Path] {
        pub def toString(x: Path): String = 
            Basis.IO.Path.toString(x)
    }

    instance Eq[Path] {
        pub def eq(x: Path, y: Path): Bool = 
            Basis.IO.Path.equals(x, y)
    }

    instance Order[Path] {
        pub def compare(x: Path, y: Path): Comparison =
            Basis.IO.Path.compareTo(x, y) |> Comparison.fromInt32
    }

    instance Hash[Path] {
        pub def hash(x: Path): Int32 = 
            Basis.IO.Path.hashCode(x)
    }



}

mod Basis.IO.Path {


    use Basis.IO.Path
    use Basis.IO.Path.{Path}
    use Basis.IO.File
    use Basis.IO.File.{File}


    pub def toString(path: Path): String = 
        import java.nio.file.Path.toString(): String \ {};
        let Path(path1) = path;
        toString(path1)

    pub def equals(x: Path, y: Path): Bool =
        import java.nio.file.Path.equals(##java.lang.Object): Bool \ {};
        let Path(x1) = x;
        let Path(y1) = y;
        equals(x1, checked_cast(y1))

    pub def compareTo(x: Path, y: Path): Int32 =
        import java.nio.file.Path.compareTo(##java.nio.file.Path): Int32 \ {};
        let Path(x1) = x;
        let Path(y1) = y;
        compareTo(x1, y1)

    pub def hashCode(path: Path): Int32 =
        import java.nio.file.Path.hashCode(): Int32 \ {};
        let Path(path1) = path;
        hashCode(path1)

    ///
    /// Returns a new Path.
    ///
    pub def new(s: String): Result[String, Path] = newWithTails(s, Nil)


    ///
    /// Returns a new Path.
    ///
    pub def newWithTails(s: String, l: List[String]): Result[String, Path] =
        Result.tryCatch(_ -> region rc {
            import static java.nio.file.Path.of(String, Array[String, rc]): ##java.nio.file.Path \ rc as ofPath;
            let arr = List.toArray(rc, l);
            Path(ofPath(s, arr))
        })


    pub def toFile(path: Path): Result[String, File] =
        Result.tryCatch(_ -> {
            import java.nio.file.Path.toFile(): ##java.io.File \ {};
            let Path(path1) = path;
            File(toFile(path1))
        })

    pub def normalize(path: Path): Path =
        import java.nio.file.Path.normalize(): ##java.nio.file.Path \ {};
        let Path(p1) = path;
        Path(normalize(p1))


    /// If `path` is a relative path `toAbsolutePath` resolves the path in a system specific manner.
    /// Should this be Impure?
    pub def toAbsolutePath(path: Path): Result[String, Path] =
        Result.tryCatch(_ -> {
            import java.nio.file.Path.toAbsolutePath(): ##java.nio.file.Path \ {};
            let Path(p1) = path;
            toAbsolutePath(p1) |> Path
        })

    pub def isAbsolute(path: Path): Bool =
        import java.nio.file.Path.isAbsolute(): Bool \ {};
        let Path(path1) = path;
        isAbsolute(path1)

    pub def isRelative(path: Path): Bool = 
        not isAbsolute(path)

    ///
    /// Returns `true` if the filepath `path` starts with the Path `prefix`.
    ///
    pub def startsWith(prefix: {prefix = Path}, path: Path): Bool =
        import java.nio.file.Path.startsWith(##java.nio.file.Path): Bool \ {};
        let Path(path1) = path;
        let Path(prefix1) = prefix.prefix;
        startsWith(path1, prefix1)

    ///
    /// Returns `true` if the filepath `path` ends with the Path `suffix`.
    ///
    pub def endsWith(suffix: {suffix = Path}, path: Path): Bool =
        import java.nio.file.Path.endsWith(##java.nio.file.Path): Bool \ {};
        let Path(path1) = path;
        let Path(suffix1) = suffix.suffix;
        endsWith(path1, suffix1)


    pub def getNameAt(ix: Int32, path: Path): Result[String, Path] =
        Result.tryCatch(_ -> {
            import java.nio.file.Path.getName(Int32): ##java.nio.file.Path \ {};
            let Path(path1) = path;
            getName(path1, ix) |> Path
        })

    pub def getNameCount(path: Path): Int32 =
        import java.nio.file.Path.getNameCount(): Int32 \ {};
        let Path(path1) = path;
        getNameCount(path1)


    pub def getRoot(path: Path): Option[Path] =
        import java.nio.file.Path.getRoot(): ##java.nio.file.Path \ {};
        let Path(path1) = path;
        getRoot(path1) |> Object.toOption |> Option.map(Path)

    pub def getParent(path: Path): Option[Path] =
        import java.nio.file.Path.getParent(): ##java.nio.file.Path \ {};
        let Path(path1) = path;
        getParent(path1) |> Object.toOption |> Option.map(Path)

    pub def getFileName(path: Path): Option[Path] =
        import java.nio.file.Path.getFileName(): ##java.nio.file.Path \ {};
        let Path(path1) = path;
        getFileName(path1) |> Object.toOption |> Option.map(Path)


    pub def resolve(path: {path = Path}, other: {other = Path}): Path =
        import java.nio.file.Path.resolve(##java.nio.file.Path): ##java.nio.file.Path \ {};
        let Path(path1) = path.path;
        let Path(other1) = other.other;
        Path(resolve(path1, other1))


    pub def append(path: {path = Path}, other: {other = Path}): Path =
        normalize(resolve(path, other))

    ///
    /// Returns `path1` with the path name contracted relative to `path2`.
    ///
    pub def relativize(path1: {path1 = Path}, path2: {path2 = Path}): Path =
        import java.nio.file.Path.relativize(##java.nio.file.Path): ##java.nio.file.Path \ {};
        let Path(p1) = path1.path1;
        let Path(p2) = path2.path2;
        Path(relativize(p1, p2))


/*
    /// pub def filePathConcat(l: List[String]): Path =
    ///     region r {
    ///         import static java.nio.file.Path.of(String, Array[String, r]): ##java.nio.file.Path \ r as of1;
    ///         try {
    ///             match l {
    ///                 case x :: rs => Path(FlixSandbox.Deprecated.Marshal.runVaragsOfString(rs, of1(x), r)) as \ Pure
    ///                 case Nil     => empty()
    ///             }
    ///         } catch {
    ///             case _: ##java.lang.Exception => empty()
    ///         }
    ///     }


    pub def tryNew(s: String): Result[String, Path] =
        region r {
            Result.tryCatch(_ -> {
                import static java.nio.file.Path.of(String, Array[String, r]): ##java.nio.file.Path \ r as of1;
                Path(of1(s, [] @ r))
            })
        }
*/
/*
    pub def empty(): Path =
        match newPath("") {
            case Ok(p1) => p1
            case Err(msg) => bug!(msg)
        }


    pub def splitFileName(path: Path): (Option[Path], Option[Path]) =
        (getParent(path), getFileName(path))

    pub def replaceFileName(path: Path, name: String): Path =
        let file = filePath1(name);
        match getParent(path) {
            case Some(dir) => append(dir, file)
            case None => file
        }

    /// e.g. getBaseName('/home.stephen.temp01.txt') = "temp01"
    pub def getBaseName(path: Path): Option[String] =
        forM (file <- getFileName(path);
                base <- Some(dropExtensions(file))
        ) yield toString(base)

    pub def putBaseName(path: Path, name: String): Path =
        match (getParent(path), getExtensions(path)) {
            case (Some(root), Some(exts)) => append(root, filePath1(name + "." + exts))
            case (None, Some(exts))       => filePath1(name + "." + exts)
            case (_, _)                   => path
        }

    pub def mapBaseName(f: String -> String, path: Path): Path =
        match getBaseName(path) {
            case Some(name1) => putBaseName(path, f(name1))
            case _ => path
        }

    pub def testBaseName(f: String -> Bool, path: Path): Bool =
        match getBaseName(path) {
            case Some(name1) => f(name1)
            case _ => false
        }



    pub def concat(xs: List[Path]): Path = match xs {
        case Nil => empty()
        case root :: rs => normalize(List.foldLeft(resolve, root, rs))
    }

    pub def <<>>(path: Path, name1: String): Path = snoc(path, name1)

    pub def snoc(path: Path, name1: String): Path =
        match newPath(name1) {
            case Ok(path1) => append(path, path1)
            case Err(_) => path
        }

    pub def push(name1: String, path: Path): Path =
        match newPath(name1) {
            case Ok(path1) => append(path, path1)
            case Err(_)    => path
        }


    ///
    /// Returns `path1` with the path name contracted relative to `path2`.
    ///
    pub def makeRelative(path1: Path, path2: Path): Path =
        Basis.IO.Path.relativize(path1, path2)



    ///
    /// Helper function for `getNameAt`.
    ///
    /// This is a wrapper around the Java function `getName` which does not
    /// look at root, if present.
    ///
    def getNameAtHelper(path: Path, ix: Int32): Option[Path] =
        Basis.IO.Path.getNameAt(ix, path) |> Result.toOption

    pub def hasExtension(path: Path): Bool =
        match getFileName(path) |> Option.map(toString) {
            case None => false
            case Some(str) => String.startsWith({prefix = "."}, str)
        }


    pub def getExtension(path: Path): Option[String] =
        forM (s <- getFileName(path) |> Option.map(toString);
                ix <- String.indexOfRight({substr = "."}, s)
        ) yield String.sliceRight(start = ix+1, s)

    ///
    /// Replaces the extension.
    /// If the Path has multiple extenstion only the rightmost extension
    /// is replaced.
    ///
    pub def putExtension(path: Path, ext: String): Path =
        match getExtension(path) {
            case Some(ext0) => {
                let str = toString(path);
                let lhs = String.dropRight(String.length(ext0), str);
                filePath1(lhs + ext)
            }
            case None => path
        }

    ///
    /// Drop only the rightmost extension if the Path has mutliple
    /// extensions, i.e. "archive.tar.gz" becomes "archive.tar".
    ///
    pub def dropExtension(path: Path): Path = match getExtension(path) {
        case Some(ext) => {
            let str = toString(path);
            let lhs = String.dropRight(String.length(ext) + 1, str);
            filePath1(lhs)
        }
        case None => path
    }

    pub def splitExtension(path: Path): (Path, Option[String]) =
        (dropExtension(path), getExtension(path))

    pub def mapExtension(f: String -> String, path: Path): Path =
        let (path1, ext) = splitExtension(path);
        match ext {
            case Some(s1) => addExtension(path1, f(s1))
            case None => path
        }

    /// false if no extension
    pub def testExtension(f: String -> Bool, path: Path): Bool =
        match getExtension(path) {
            case Some(s1) => f(s1)
            case None => false
        }

    pub def isExtension(path: Path, ext: String): Bool =
        testExtension(x -> x == ext, path)

    pub def isExtensionOneOf(path: Path, xs: List[String]): Bool =
        testExtension(x -> List.memberOf(x, xs), path)

    /// Suffixes the extension `ext` even if the path already has an extension.
    /// e.g. addExtension("archive.tar", "gz") == "archive.tar.gz"
    pub def addExtension(path: Path, ext: String): Path =
        if (String.isEmpty(ext))
            path
        else {
            let str = toString(path);
            filePath1(str + "." + ext)
        }

    ///
    /// Return all extensions if the Path has multiple extensions,
    /// i.e. "archive.tar.gz" becomes "tar.gz".
    ///
    pub def getExtensions(path: Path): Option[String] =
        use Option.flatMap;
        forM (s <- getFileName(path) |> Option.map(toString);
                ix <- String.indexOfLeft({substr = "."}, s)
        ) yield String.sliceRight(start = ix + 1, s)

    ///
    /// Drop all extensions if the Path has mutliple extensions,
    /// i.e. "archive.tar.gz" becomes "archive".
    ///
    pub def dropExtensions(path: Path): Path = match getExtensions(path) {
        case Some(ext) => {
            let str = toString(path);
            let lhs = String.dropRight(String.length(ext) + 1, str);
            filePath1(lhs)
        }
        case None => path
    }

    pub def putExtensions(path: Path, ext: String): Path =
        match getExtensions(path) {
            case Some(ext0) => {
                let str = toString(path);
                let lhs = String.dropRight(String.length(ext0), str);
                filePath1(lhs + ext)
            }
            case None => path
        }

    pub def splitExtensions(path: Path): (Path, Option[String]) =
        (dropExtensions(path), getExtensions(path))

    ///
    /// Drop the extension `ext` from the Path and the dot preceeding it.
    /// If the extension of the Path does not match ext or the Path
    /// does not have an extension return None.
    ///
    pub def stripExtension(path: Path, ext: String): Option[Path] =
        forM (ext1 <- getExtension(path);
                ans <- if (ext1 == ext) Some(dropExtension(path)) else None
        ) yield ans

    /// Multiple extension version of `stripExtension`.
    pub def stripExtensions(path: Path, exts: String): Option[Path] =
        forM (exts1 <- getExtensions(path);
                ans <- if (exts1 == exts) Some(dropExtensions(path)) else None
        ) yield ans

    pub def split(path: Path): List[Path] =
        let n = getNameCount(path);
        splitHelper(path, n, 0, xs -> xs)

    def splitHelper(path: Path, count: Int32, i: Int32, k: List[Path] -> List[Path]): List[Path] =
        if (i >= count)
            k(Nil)
        else
            // Note - `None` case should be impossible.
            match getNameAt(path, i) {
                case Some(x) => splitHelper(path, count, i+1, xs -> k(x :: xs))
                case None => k(Nil)
            }
*/
/*
    // Better in a FileSystems module?
    
    def pathMatcherMatches(path: Path, syntaxAndPatt: String): Result[String, Bool] \ IO =
        import static java.nio.file.FileSystems.getDefault(): ##java.nio.file.FileSystem \ IO;
        import java.nio.file.FileSystem.getPathMatcher(String): ##java.nio.file.PathMatcher \ IO;
        import java.nio.file.PathMatcher.matches(##java.nio.file.Path): Bool \ IO;
        try {
            let Path(path1) = path;
            let fs = getDefault();
            let m1 = getPathMatcher(fs, syntaxAndPatt);
            Ok(matches(m1, path1))
        } catch {
            case _: ##java.lang.Exception => Err("pathMatcherMatches")
        }

    pub def isGlobMatch(glob: String, path: Path): Result[String, Bool] =
        pathMatcherMatches(path, "glob:" + glob)

    pub def isRegexMatch(patt: String, path: Path): Result[String, Bool] =
        pathMatcherMatches(path, "regex:" + patt)

*/
/*
    pub def toFile(r: Region[r], path: Path): Result[String, Interop.IO.File[r]] \ r =
        Basis.IO.Path.toFile(r, path)

    pub def fromFile(file: Interop.IO.File[r]): Result[String, Path] \ r =
        Interop.IO.File.toPath(file)
*/
}
