set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.0303, <2> 26.8697, <3> 2.7123, <4> 27.386, <5> 48.1993, <6> 48.964, <7> 34.6449, <8> 0.628, <9> 38.0564, <10> 4.9455, <11> 16.4884, <12> 31.5555, <13> 23.3335, <14> 13.868, <15> 18.4381, <16> 40.2644, <17> 2.2456, <18> 0.3194, <19> 25.3723, <20> 30.1403;
param workload[JOB] := <1> 24.8306, <2> 6.4872, <3> 47.0625, <4> 36.7373, <5> 44.1585, <6> 42.2216, <7> 25.5182, <8> 29.5106, <9> 21.3386, <10> 41.4465, <11> 13.8629, <12> 45.2795, <13> 7.5437, <14> 12.4213, <15> 42.5584, <16> 46.7105, <17> 14.838, <18> 10.021, <19> 16.9843, <20> 3.8179;
param capacity[MACHINE] := <1> 88.8915, <2> 88.8915, <3> 88.8915, <4> 88.8915, <5> 88.8915, <6> 88.8915;

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
