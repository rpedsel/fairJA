set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.29, <2> 14.8731, <3> 21.2515, <4> 30.9932, <5> 28.8369, <6> 23.7939, <7> 26.1877, <8> 31.0205, <9> 25.8838, <10> 23.0339, <11> 17.987, <12> 23.7095, <13> 25.1799, <14> 35.4673, <15> 25.3188, <16> 29.4531, <17> 27.105, <18> 21.1816, <19> 23.6113, <20> 25.4885;
param workload[JOB] := <1> 4.2767, <2> 3.8566, <3> 4.6099, <4> 5.5672, <5> 5.37, <6> 4.8779, <7> 5.1174, <8> 5.5696, <9> 5.0876, <10> 4.7994, <11> 4.2411, <12> 4.8692, <13> 5.018, <14> 5.9554, <15> 5.0318, <16> 5.4271, <17> 5.2062, <18> 4.6023, <19> 4.8591, <20> 5.0486;
param capacity[MACHINE] := <1> 10.649, <2> 10.649, <3> 10.649, <4> 10.649, <5> 10.649, <6> 10.649, <7> 10.649;

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
