set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.2671, <2> 36.5561, <3> 20.8633, <4> 19.7024, <5> 0.0174, <6> 10.1413, <7> 6.0159, <8> 4.5682, <9> 42.9969, <10> 44.1106, <11> 8.5786, <12> 7.362, <13> 26.9246, <14> 45.4965, <15> 14.5262, <16> 16.5268, <17> 16.6004, <18> 15.5213, <19> 6.4113, <20> 2.9472;
param workload[JOB] := <1> 6.186, <2> 6.0462, <3> 4.5676, <4> 4.4387, <5> 0.1319, <6> 3.1845, <7> 2.4527, <8> 2.1373, <9> 6.5572, <10> 6.6416, <11> 2.9289, <12> 2.7133, <13> 5.1889, <14> 6.7451, <15> 3.8113, <16> 4.0653, <17> 4.0744, <18> 3.9397, <19> 2.5321, <20> 1.7167;
param capacity[MACHINE] := <1> 8.5778, <2> 8.5778, <3> 8.5778, <4> 8.5778, <5> 8.5778, <6> 8.5778, <7> 8.5778;

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
