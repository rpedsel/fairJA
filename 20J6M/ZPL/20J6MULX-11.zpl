set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.1192, <2> 11.6742, <3> 27.2495, <4> 42.7436, <5> 22.3373, <6> 39.2385, <7> 32.191, <8> 12.8695, <9> 42.1171, <10> 19.8828, <11> 18.0145, <12> 47.3643, <13> 32.008, <14> 15.8035, <15> 2.2941, <16> 24.1445, <17> 27.0389, <18> 18.3761, <19> 12.4818, <20> 32.955;
param workload[JOB] := <1> 6.4899, <2> 3.4168, <3> 5.2201, <4> 6.5379, <5> 4.7262, <6> 6.2641, <7> 5.6737, <8> 3.5874, <9> 6.4898, <10> 4.459, <11> 4.2443, <12> 6.8822, <13> 5.6576, <14> 3.9754, <15> 1.5146, <16> 4.9137, <17> 5.1999, <18> 4.2867, <19> 3.533, <20> 5.7406;
param capacity[MACHINE] := <1> 16.4688, <2> 16.4688, <3> 16.4688, <4> 16.4688, <5> 16.4688, <6> 16.4688;

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
