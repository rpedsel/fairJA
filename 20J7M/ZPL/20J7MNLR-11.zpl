set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.4358, <2> 23.1814, <3> 9.0374, <4> 22.7558, <5> 24.3906, <6> 24.5461, <7> 21.5527, <8> 27.1892, <9> 20.4429, <10> 23.7533, <11> 22.7133, <12> 27.422, <13> 20.6765, <14> 23.8236, <15> 26.7675, <16> 25.3521, <17> 20.1491, <18> 28.3269, <19> 23.2353, <20> 19.9388;
param workload[JOB] := <1> 3.8945, <2> 13.3341, <3> 6.8297, <4> 33.8748, <5> 45.5656, <6> 3.6722, <7> 14.2463, <8> 1.3079, <9> 4.2352, <10> 1.2349, <11> 45.6809, <12> 3.6094, <13> 6.6515, <14> 16.8221, <15> 22.5617, <16> 49.5169, <17> 48.3858, <18> 6.9901, <19> 48.8623, <20> 22.314;
param capacity[MACHINE] := <1> 57.0843, <2> 57.0843, <3> 57.0843, <4> 57.0843, <5> 57.0843, <6> 57.0843, <7> 57.0843;

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
