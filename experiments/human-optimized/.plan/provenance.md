# Track A — Provenance and seal

Status: Sealed

- Agent identity: Cursor cloud agent, run `bc-5204f77b-995a-5994-bf75-5c91ce54deae`, title "Theseus Track A: human-optimized design", run URL https://cursor.com/agents/bc-5204f77b-995a-5994-bf75-5c91ce54deae. Owning user reported by the run identity service: Scott Gardner (illtakecash@gmail.com). No subagents were spawned.
- Execution/session: The same cloud-agent run, workspace `/workspace`, starting branch `main`. Repository URL reported by the run identity service: https://github.com/illtakecash/rm-theseus. This provenance file was written in that session after the design, evaluation, and fixture bytes below were frozen.
- Model/toolchain: grok-4.7. Toolchain was the Cursor cloud agent session, `sha256sum`, and an in-session hash check that was not committed. No model other than grok-4.7 was used. No implementation code was added.
- Originating task and human authorization: Scott Gardner via Grok Bot "General Contractor". The task was to complete Track A (human-optimized, document-first) inside `experiments/human-optimized/` only, to fill the three planning files, to seal them with content hashes, and to open a pull request against `main` containing only this folder. The same instruction forbade reading the shared baseline documents for this run.
- Shared baseline commit/hash: `2031b30c0c5186d56e238fb4250e5ce74d6a5bcf` on `main`, the commit this session started from. Identifying it also revealed the commit subject `docs: record agent-native design provenance and isolation limitations`. The commit body and diff were not opened. `CHARTER.md` and root `.plan/implementation.md` were intentionally not read, despite the track README naming them as the shared baseline. The design works from this track's own instructions only. The assumptions that forces are listed in `.plan/design.md` under Assumptions.
- Allowed context and isolation mechanism: Allowed repository reads were `experiments/human-optimized/README.md`, `.plan/README.md`, and the three planning skeletons. Writes stayed in that directory. Additional non-repository context was the task text, the run identity service response, and git metadata needed to name the starting commit. Isolation mechanism: behavioral compliance only. The checkout contains the whole repository. There was no separate worktree, sparse checkout, or access-control boundary. A path-limited `git log -1` on this folder was used to name the scaffold commit below. Repo-wide `git log -p`, `git grep`, root search, and GitHub inspection of other paths were not used.
- Accidental exposure / independence status: Verified isolation is not claimed. Accidental exposure occurred and was limited to metadata. (1) The starting commit subject, quoted above, is outside the allowed documents. (2) The latest commit observed, via that path-limited log, to touch this folder before this session is `6b54a390610eb286872cabb9d0e01394e2988e83`, subject `plan: scaffold isolated design tracks (experiments/human-optimized/.plan/provenance.md)`. (3) The run identity service returned the repository URL and the owning user. No file outside `experiments/human-optimized/` was opened. Under this track's rule that any accidental exposure compromises independence, independence is **compromised**. The compromise is metadata, not document content. The architecture was not revised to answer the starting commit subject. There is no technical proof that the subject had zero influence; the design text does not use it, and the Assumptions section records the unread-baseline gap instead.
- Design/evaluation artifact hashes: SHA-256 of the frozen bytes. Design and evaluation were not edited after these digests were computed. Supporting markdown written for the fixture is listed too. The two pre-existing instruction files were not modified; their digests are included so a later reader can see exactly which instructions were in force. This provenance file is not in the list, because writing it cannot include its own final digest.

  | File | SHA-256 |
  | --- | --- |
  | `.plan/design.md` | `76a8b651bc0f4f7f1b8d1ff779491f1c876c62590f8353631aab95ed7845101b` |
  | `.plan/evaluation.md` | `39f3c3306f699192a79e45418b4dfe2388092e9bcc297b4b7dfdfc67a9dbaed5` |
  | `fixture/seal-log.md` | `2de1c32a65e3cd160a4460449340003003ec5da3cc8db1fe16e53c8be753177f` |
  | `fixture/README.md` | `f000b6ca0a29b4b7882cab8c8ed4226454971acd815b41de7dfe0119b9b93293` |
  | `fixture/b0/intent.md` | `6e057404c1a4a6d73756d9289ac1f9a4abf7d0df4dd0b3916054f632c00d1a23` |
  | `fixture/b0/parts.md` | `c66ea113ee5454847f5a818525cac8b947e377f056016f1cce51b940e25a9f33` |
  | `fixture/b0/baseline.md` | `1280e0b0d77c99bbe09d6fe8412b8ae55f0cc4bf4430ad2a7cfc0161a9d5ed62` |
  | `fixture/b0/projection.md` | `6bb3abe8f6cd869e66fe90ac8d4033ecbea640b61d8a18e98d690b002db25d77` |
  | `fixture/cycle1/observation-o1.md` | `a40b50fde9c11dfa42fa4f91f6c80b2f323f366df14ac016ab1bc190550a2244` |
  | `fixture/cycle1/diagnosis-d1.md` | `a0dd432c1a14156792c826f79789f1abe0f72b6beb76b27b9246afc86f62c2c7` |
  | `fixture/cycle1/p-notice-c1.md` | `81145495608043002140a21bccdc00fa06c08f873b056d8af612fa2368fe14ad` |
  | `fixture/cycle1/proposal-c1.md` | `93c87166d8a83e94af6b5713f0e4e78906c296e5b98fae064d1789d4a99448d5` |
  | `fixture/cycle1/packet-a1.md` | `dab5fef15f7eb982af4f5cfaafb14bc069a0f53a362464784e18a4beb43ce33c` |
  | `fixture/cycle1/assessment-a1.md` | `0b7b9f53c4069a80c4a4b4b28e9c18b8b9779543a6714fc90c6405d1c230d6a8` |
  | `fixture/cycle1/authorization-r1.md` | `784aa9b49a88040c588eb0b1a7106ffdea21083e625c96d4c38a7c3f3394c06b` |
  | `fixture/cycle1/baseline-b1.md` | `191203092d4260403b80b14d5c66a38567f32f825b56478fc1f00c54864b5467` |
  | `fixture/cycle1/observation-o2.md` | `d7b75e953f501021120945eb6fa30b815e2b78eaa6032bf3b43abd649795dbd3` |
  | `fixture/cycle2/diagnosis-d2.md` | `4810f0b21db4c7248245513910a61a4bfe0151410fd153b2e3726ca00b848495` |
  | `fixture/cycle2/p-notice-c2.md` | `7ce37051f10c004bf267bf114de0a87599a3f1c5d99fe46cf5b2b52e184a2a36` |
  | `fixture/cycle2/proposal-c2.md` | `78b49f66f07646139c670bfb0da8ae33ddd869904ce3d3d1401eb519448f638b` |
  | `fixture/cycle2/packet-a2.md` | `36fb3961092fc19fbda730a8be2a9475c8412143024692a998de259b3e1f7ab8` |
  | `fixture/cycle2/assessment-a2.md` | `aefdae23d090f666c93763f0fd64e061704a9796e3f5e48fe3f7bd9cbe5de406` |
  | `fixture/cycle2/refusal-r2.md` | `a7ce9546a0dc1e635dfe5274f3c5145490121c484269256484e9725d79cbe791` |
  | `fixture/cycle2/observation-o3.md` | `d0a5de834d3ad87aab540f15ebf2eb75451fd1aceb573ec4dafbef8bd6523afa` |
  | `fixture/cycle2/reeval-f2.md` | `5f0a5c9180f5764b9fd2fe7dedf5b0f85c3a0c13ba5005a7a2e1842e68221905` |
  | `fixture/register.md` | `d41db39bc4ea6f96afbdf273fadec5fdba8040577cc6b52e44ed07504dc2b5ce` |
  | `README.md` (pre-existing, unmodified) | `22aebc7ace00001ee322bd0779a48445dcdc4e45b82697933b78c80fbc1d95f9` |
  | `.plan/README.md` (pre-existing, unmodified) | `02ebc23da12dfba2f84c688c850d7e829d94e806eaa3599c7812ec00646e2bd4` |

- Validation performed: `sha256sum` matches the design, evaluation, and seal-log digests above. Every `filename` plus 64-hex digest quoted inside the fixture resolved to the current bytes of that file. Packet A1 and packet A2 copies of their source files compared equal to those sources. The seal log's `prev` chain was recomputed from `genesis` over each record line including its newline and matched. Assessments do not contain the diagnosis cause-claim wording; they do name the excluded filenames. Byte rules (UTF-8, LF, one trailing newline, no trailing spaces) held for the markdown in this folder at seal time. No second context re-ran the packets. No scanner was written. A repository-wide pull-request template was not searched for, because that search would leave this folder.
- Parent commits/artifacts: Starting commit `2031b30c0c5186d56e238fb4250e5ce74d6a5bcf`. Scaffold commit observed for this path `6b54a390610eb286872cabb9d0e01394e2988e83`. Pre-existing artifacts in force: `README.md`, `.plan/README.md`, and the empty section skeletons this session replaced in the three planning files.
- Sealed timestamp and commit: Content freeze `2026-11-01T20:13:18Z` (UTC), which is the timestamp on every fixture seal-log record. Design status Complete. Evaluation status Complete. This file's status is Sealed. The git commit that introduces these frozen bytes is recorded in the follow-up line below once that commit exists, so this recording does not change the design or evaluation digests.

  Sealing commit: `PENDING-AFTER-COMMIT`
