set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.0693, <2> 27.4898, <3> 10.302, <4> 36.3677, <5> 19.6195, <6> 12.1159, <7> 46.9652, <8> 24.1878, <9> 9.7508, <10> 2.5841;
param workload[JOB] := <1> 258.2224, <2> 755.6891, <3> 106.1312, <4> 1322.6096, <5> 384.9248, <6> 146.795, <7> 2205.73, <8> 585.0497, <9> 95.0781, <10> 6.6776;
param capacity[MACHINE] := <1> 3602.1805, <2> 3602.1805, <3> 3602.1805;

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
