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


mod Basis.IO.File {

    ///
    /// Represents an LinkOption.
    ///
    pub enum LinkOption with Eq, Order, ToString, Hash {
        case NofollowLinks
    }

}

mod Basis.IO.File.LinkOption {

    use Basis.IO.File.CopyOption
    use Basis.IO.File.CopyOption.{CopyOption}
    use Basis.IO.File.OpenOption
    use Basis.IO.File.OpenOption.{OpenOption}

    pub def asCopyOption(o: LinkOption): CopyOption = 
        let o1 = linkOptionToJava(o);
        CopyOption(checked_cast(o1))
        
    pub def asOpenOption(o: LinkOption): OpenOption = 
        let o1 = linkOptionToJava(o);
        OpenOption(checked_cast(o1))

    pub def linkOptionToJava(o: LinkOption): ##java.nio.file.LinkOption = 
        import static get java.nio.file.LinkOption.NOFOLLOW_LINKS: ##java.nio.file.LinkOption \ {} as get_NOFOLLOW_LINKS;
        match o {
            case NofollowLinks  => get_NOFOLLOW_LINKS()
        }

    def primEquals(x: ##java.nio.file.LinkOption, y: ##java.nio.file.LinkOption): Bool =
        import java.lang.Enum.equals(##java.lang.Object): Bool \ {};
        let x1 = checked_cast(x);
        let y1 = checked_cast(y);
        equals(x1, y1)

    pub def linkOptionFromJava(o: ##java.nio.file.LinkOption): LinkOption = 
        import static get java.nio.file.LinkOption.NOFOLLOW_LINKS: ##java.nio.file.LinkOption \ {} as get_NOFOLLOW_LINKS;
        match o {
            case x1 if primEquals(x1, get_NOFOLLOW_LINKS()) => NofollowLinks
            case _                                          => bug!("linkOptionFromJava")
        }
}