set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.0406, <2> 8.1012, <3> 14.1525, <4> 11.7462, <5> 25.7089, <6> 11.6661, <7> 30.3401, <8> 32.3932, <9> 9.7699, <10> 26.2707, <11> 43.2302, <12> 33.0544, <13> 40.9493, <14> 44.9571, <15> 14.1414, <16> 9.4619, <17> 42.2941, <18> 21.7447, <19> 42.4145, <20> 0.2553;
param workload[JOB] := <1> 4.128, <2> 2.8463, <3> 3.762, <4> 3.4273, <5> 5.0704, <6> 3.4156, <7> 5.5082, <8> 5.6915, <9> 3.1257, <10> 5.1255, <11> 6.575, <12> 5.7493, <13> 6.3992, <14> 6.705, <15> 3.7605, <16> 3.076, <17> 6.5034, <18> 4.6631, <19> 6.5126, <20> 0.5053;
param capacity[MACHINE] := <1> 9.916, <2> 9.916, <3> 9.916, <4> 9.916, <5> 9.916, <6> 9.916, <7> 9.916;

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
