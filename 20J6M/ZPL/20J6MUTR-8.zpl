set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.0989, <2> 48.1448, <3> 7.2691, <4> 4.5216, <5> 37.9844, <6> 15.0415, <7> 32.522, <8> 15.5316, <9> 5.9812, <10> 18.1062, <11> 18.9218, <12> 19.7431, <13> 44.719, <14> 39.0779, <15> 34.0618, <16> 46.205, <17> 29.9532, <18> 20.2963, <19> 28.7601, <20> 42.3932;
param workload[JOB] := <1> 25.3272, <2> 42.6087, <3> 41.5657, <4> 35.5869, <5> 33.444, <6> 39.7609, <7> 44.6875, <8> 20.2759, <9> 12.7756, <10> 37.1059, <11> 35.4517, <12> 45.0338, <13> 2.365, <14> 17.4218, <15> 33.8707, <16> 9.8045, <17> 15.8619, <18> 17.6615, <19> 39.1941, <20> 39.7092;
param capacity[MACHINE] := <1> 73.6891, <2> 73.6891, <3> 73.6891, <4> 73.6891, <5> 73.6891, <6> 73.6891;

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
