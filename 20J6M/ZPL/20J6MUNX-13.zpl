set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.5635, <2> 36.4836, <3> 11.0295, <4> 34.2961, <5> 7.3517, <6> 32.7064, <7> 33.5316, <8> 31.4434, <9> 6.7869, <10> 25.8345, <11> 20.7535, <12> 40.0959, <13> 23.8476, <14> 10.4003, <15> 33.6179, <16> 6.6512, <17> 48.783, <18> 34.4954, <19> 37.5693, <20> 25.125;
param workload[JOB] := <1> 7.0401, <2> 6.0402, <3> 3.3211, <4> 5.8563, <5> 2.7114, <6> 5.719, <7> 5.7906, <8> 5.6074, <9> 2.6052, <10> 5.0828, <11> 4.5556, <12> 6.3321, <13> 4.8834, <14> 3.2249, <15> 5.7981, <16> 2.579, <17> 6.9845, <18> 5.8733, <19> 6.1294, <20> 5.0125;
param capacity[MACHINE] := <1> 101.1469, <2> 101.1469, <3> 101.1469, <4> 101.1469, <5> 101.1469, <6> 101.1469;

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
