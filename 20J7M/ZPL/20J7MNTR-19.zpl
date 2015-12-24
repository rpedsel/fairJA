set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.236, <2> 20.9309, <3> 16.3012, <4> 29.5844, <5> 25.6032, <6> 19.6036, <7> 17.7512, <8> 23.3028, <9> 24.7236, <10> 28.1792, <11> 24.7818, <12> 20.6148, <13> 31.485, <14> 24.044, <15> 20.1053, <16> 26.6148, <17> 23.694, <18> 18.087, <19> 27.9066, <20> 15.3311;
param workload[JOB] := <1> 46.1746, <2> 12.38, <3> 21.2935, <4> 17.7951, <5> 44.6892, <6> 8.0533, <7> 17.4323, <8> 36.9845, <9> 16.681, <10> 49.0039, <11> 46.7341, <12> 40.7006, <13> 48.5034, <14> 33.2268, <15> 14.4653, <16> 2.5154, <17> 37.0672, <18> 1.2782, <19> 17.7575, <20> 0.9648;
param capacity[MACHINE] := <1> 55.0393, <2> 55.0393, <3> 55.0393, <4> 55.0393, <5> 55.0393, <6> 55.0393, <7> 55.0393;

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
