set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.4537, <2> 24.4644, <3> 25.3018, <4> 24.3065, <5> 15.9042, <6> 20.8735, <7> 20.628, <8> 21.3767, <9> 19.4182, <10> 23.3423, <11> 27.6382, <12> 33.2809, <13> 27.2056, <14> 24.1629, <15> 20.308, <16> 32.3073, <17> 30.1723, <18> 25.2579, <19> 26.6184, <20> 21.3844;
param workload[JOB] := <1> 22.7287, <2> 10.6878, <3> 45.2782, <4> 15.9773, <5> 45.3368, <6> 23.9791, <7> 36.1693, <8> 10.6745, <9> 22.7488, <10> 42.7369, <11> 42.5438, <12> 42.1289, <13> 41.1961, <14> 3.864, <15> 32.3144, <16> 5.6968, <17> 21.6817, <18> 48.586, <19> 2.0366, <20> 42.9852;
param capacity[MACHINE] := <1> 59.9305, <2> 59.9305, <3> 59.9305, <4> 59.9305, <5> 59.9305, <6> 59.9305, <7> 59.9305;

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
