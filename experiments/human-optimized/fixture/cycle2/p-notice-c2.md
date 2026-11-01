# Candidate realization C2

Plank offered for P-NOTICE while finding F2 is open. This file is a yard plank unless a baseline points at it.

### P-NOTICE — Dock notice

- Kind: part
- Role: Show passengers on the dock the authorized passenger limit before they board.
- Depends-on: P-LOAD
- Does-not-depend-on: P-CREW
- Bound-invariants: INV-2, INV-3
- Review-on: an observation names P-NOTICE, or a part named by Depends-on changes a Norm line
- Norm: shown-limit = 10
- Norm: posted-text = Theseus ferry. No more than 10 passengers. Crew must count passengers and stop at this number.
- Norm: crew-duty-on-notice = count-and-stop
- Norm: stop-rule = notice-number
- Restatement: The dock notice shows 10 and reads: Theseus ferry. No more than 10 passengers. Crew must count passengers and stop at this number. The crew duty on the notice is count-and-stop, and the stop rule is notice-number.
- History: Offered against finding F2. The shown limit stays 10. A crew duty and a stop rule are added on this notice.
