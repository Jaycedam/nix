_: {
  programs.rmpc = {
    enable = true;
    config = ''
      #![enable(implicit_some)]
      #![enable(unwrap_newtypes)]
      #![enable(unwrap_variant_newtypes)]
      (
          cache_dir: None,
          scrolloff: 10,
          wrap_navigation: false,
          rewind_to_start_sec: None,
          keep_state_on_song_change: true,
          reflect_changes_to_playlist: false,
          select_current_song_on_change: false,
          ignore_leading_the: false,
          browser_song_sort: [Disc, Track, Artist, Title],
          directories_sort: SortFormat(group_by_type: true, reverse: false),
          keybinds: (
              global: {
                  ":":       CommandMode,
                  "s":       Stop,
                  "<Tab>":   NextTab,
                  "<S-Tab>": PreviousTab,
                  "1":       SwitchToTab("Queue"),
                  "2":       SwitchToTab("Album Artists"),
                  "3":       SwitchToTab("Playlists"),
                  "4":       SwitchToTab("Search"),
                  "q":       Quit,
                  ">":       NextTrack,
                  "p":       TogglePause,
                  "<":       PreviousTrack,
                  "f":       SeekForward,
                  "R":       ToggleRepeat,
                  "r":       ToggleRandom,
                  "b":       SeekBack,
                  "?":       ShowHelp,
                  "u":       Update,
                  "U":       Rescan,
                  "I":       ShowCurrentSongInfo,
              },
              navigation: {
                  "k":         Up,
                  "j":         Down,
                  "h":         Left,
                  "l":         Right,
                  "<Up>":      Up,
                  "<Down>":    Down,
                  "<Left>":    Left,
                  "<Right>":   Right,
                  "<C-k>":     PaneUp,
                  "<C-j>":     PaneDown,
                  "<C-h>":     PaneLeft,
                  "<C-l>":     PaneRight,
                  "<C-u>":     UpHalf,
                  "N":         PreviousResult,
                  "a":         Add,
                  "A":         AddAll,
                  "r":         Rename,
                  "n":         NextResult,
                  "g":         Top,
                  "<Space>":   Select,
                  "<C-Space>": InvertSelection,
                  "G":         Bottom,
                  "<CR>":      Confirm,
                  "i":         FocusInput,
                  "J":         MoveDown,
                  "<C-d>":     DownHalf,
                  "/":         EnterSearch,
                  "<C-c>":     Close,
                  "<Esc>":     Close,
                  "K":         MoveUp,
                  "D":         Delete,
                  "B":         ShowInfo,
                  "<C-z>":     ContextMenu(),
                  "<C-s>":     Save(kind: Modal(all: false, duplicates_strategy: Ask)),
              },
              queue: {
                  "D":       DeleteAll,
                  "<CR>":    Play,
                  "a":       AddToPlaylist,
                  "d":       Delete,
                  "C":       JumpToCurrent,
                  "X":       Shuffle,
              },
          ),
          tabs: [
              (
                  name: "Queue",
                  pane: Split(
                      direction: Horizontal,
                      panes: [
                          (
                              size: "40%",
                              pane: Split(
                                  direction: Vertical,
                                  panes: [
                                      (
                                          size: "3",
                                          pane: Pane(Lyrics)
                                      ),
                                      (
                                          size: "100%",
                                          pane: Pane(AlbumArt)
                                      ),
                                  ],
                              ),
                          ),
                          (
                              size: "60%",
                              pane: Pane(Queue)
                          ),
                      ],
                  ),
              ),
              (
                  name: "Album Artists",
                  pane: Pane(AlbumArtists),
              ),
              (
                  name: "Playlists",
                  pane: Pane(Playlists),
              ),
              (
                  name: "Search",
                  pane: Pane(Search),
              ),
          ],
      )
    '';
  };
}
