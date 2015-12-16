set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.5394, <2> 6.2636, <3> 41.1679, <4> 27.5896, <5> 32.8445, <6> 25.8346, <7> 26.3283, <8> 3.5822, <9> 31.0413, <10> 8.1391, <11> 7.6613, <12> 48.806, <13> 7.8232, <14> 36.4037, <15> 47.1248, <16> 18.424, <17> 49.793, <18> 28.6014, <19> 48.5451, <20> 28.3;
param workload[JOB] := <1> 4.188, <2> 2.5027, <3> 6.4162, <4> 5.2526, <5> 5.731, <6> 5.0828, <7> 5.1311, <8> 1.8927, <9> 5.5715, <10> 2.8529, <11> 2.7679, <12> 6.9861, <13> 2.797, <14> 6.0335, <15> 6.8648, <16> 4.2923, <17> 7.0564, <18> 5.348, <19> 6.9674, <20> 5.3198;
param capacity[MACHINE] := <1> 16.5091, <2> 16.5091, <3> 16.5091, <4> 16.5091, <5> 16.5091, <6> 16.5091;

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
