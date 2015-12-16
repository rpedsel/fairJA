set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.755, <2> 25.8519, <3> 29.1266, <4> 23.2806, <5> 23.3294, <6> 25.0821, <7> 31.4492, <8> 29.4375, <9> 26.8849, <10> 28.0217, <11> 29.967, <12> 14.6468, <13> 26.7671, <14> 17.4049, <15> 23.7289, <16> 28.7426, <17> 25.9305, <18> 24.4818, <19> 24.3593, <20> 24.2982;
param workload[JOB] := <1> 24.755, <2> 25.8519, <3> 29.1266, <4> 23.2806, <5> 23.3294, <6> 25.0821, <7> 31.4492, <8> 29.4375, <9> 26.8849, <10> 28.0217, <11> 29.967, <12> 14.6468, <13> 26.7671, <14> 17.4049, <15> 23.7289, <16> 28.7426, <17> 25.9305, <18> 24.4818, <19> 24.3593, <20> 24.2982;
param capacity[MACHINE] := <1> 63.4432, <2> 63.4432, <3> 63.4432, <4> 63.4432, <5> 63.4432, <6> 63.4432;

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
