set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.4221, <2> 49.2713, <3> 27.7728, <4> 32.8243, <5> 6.0397, <6> 0.6759, <7> 33.6304, <8> 13.4404, <9> 31.4324, <10> 34.6501, <11> 45.0693, <12> 1.6067, <13> 44.2422, <14> 34.6191, <15> 4.2204, <16> 39.0291, <17> 49.1465, <18> 39.8974, <19> 38.9594, <20> 24.2496;
param workload[JOB] := <1> 2.0224, <2> 2427.661, <3> 771.3284, <4> 1077.4347, <5> 36.478, <6> 0.4568, <7> 1131.0038, <8> 180.6444, <9> 987.9958, <10> 1200.6294, <11> 2031.2418, <12> 2.5815, <13> 1957.3723, <14> 1198.4821, <15> 17.8118, <16> 1523.2706, <17> 2415.3785, <18> 1591.8025, <19> 1517.8348, <20> 588.0431;
param capacity[MACHINE] := <1> 2213.515, <2> 2213.515, <3> 2213.515, <4> 2213.515, <5> 2213.515, <6> 2213.515, <7> 2213.515;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;