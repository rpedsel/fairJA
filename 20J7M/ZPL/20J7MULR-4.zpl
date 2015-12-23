set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.1957, <2> 12.694, <3> 27.4592, <4> 12.2189, <5> 2.9525, <6> 15.5677, <7> 14.2251, <8> 49.6161, <9> 42.0667, <10> 38.258, <11> 9.5726, <12> 37.4552, <13> 8.0912, <14> 0.2591, <15> 26.2361, <16> 29.1471, <17> 42.9993, <18> 44.5015, <19> 44.8567, <20> 33.4466;
param workload[JOB] := <1> 33.0664, <2> 16.9129, <3> 1.7635, <4> 36.8636, <5> 24.865, <6> 2.357, <7> 0.7842, <8> 3.5061, <9> 20.5232, <10> 10.1624, <11> 31.1233, <12> 23.0103, <13> 23.7459, <14> 6.29, <15> 17.3972, <16> 0.7658, <17> 32.2485, <18> 34.9931, <19> 5.7967, <20> 41.4555;
param capacity[MACHINE] := <1> 52.5187, <2> 52.5187, <3> 52.5187, <4> 52.5187, <5> 52.5187, <6> 52.5187, <7> 52.5187;

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
