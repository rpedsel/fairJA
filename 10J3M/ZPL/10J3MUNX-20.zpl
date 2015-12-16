set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.0126, <2> 9.0714, <3> 41.1333, <4> 1.5424, <5> 48.1387, <6> 14.7369, <7> 40.466, <8> 31.35, <9> 32.1826, <10> 9.7369;
param workload[JOB] := <1> 2.6481, <2> 3.0119, <3> 6.4135, <4> 1.2419, <5> 6.9382, <6> 3.8389, <7> 6.3613, <8> 5.5991, <9> 5.673, <10> 3.1204;
param capacity[MACHINE] := <1> 44.8463, <2> 44.8463, <3> 44.8463;

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
