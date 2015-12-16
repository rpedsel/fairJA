set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.2693, <2> 28.5091, <3> 20.4572, <4> 12.6616, <5> 31.7701, <6> 25.8148, <7> 29.0264, <8> 23.8745, <9> 30.2895, <10> 20.7989, <11> 20.5363, <12> 32.2426, <13> 20.7452, <14> 27.7211, <15> 29.3436, <16> 23.1733, <17> 13.742, <18> 34.299, <19> 28.0309, <20> 23.045;
param workload[JOB] := <1> 42.3133, <2> 49.6333, <3> 33.3696, <4> 38.3234, <5> 2.2483, <6> 10.7707, <7> 44.9913, <8> 36.6068, <9> 36.4292, <10> 44.8523, <11> 22.0006, <12> 21.0652, <13> 29.5797, <14> 21.1724, <15> 25.0729, <16> 10.9072, <17> 44.9119, <18> 47.7704, <19> 22.508, <20> 27.8278;
param capacity[MACHINE] := <1> 76.5443, <2> 76.5443, <3> 76.5443, <4> 76.5443, <5> 76.5443, <6> 76.5443;

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
